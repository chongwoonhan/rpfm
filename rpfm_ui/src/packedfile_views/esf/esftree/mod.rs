//---------------------------------------------------------------------------//
// Copyright (c) 2017-2020 Ismael Gutiérrez González. All rights reserved.
//
// This file is part of the Rusted PackFile Manager (RPFM) project,
// which can be found here: https://github.com/Frodo45127/rpfm.
//
// This file is licensed under the MIT license, which can be found here:
// https://github.com/Frodo45127/rpfm/blob/master/LICENSE.
//---------------------------------------------------------------------------//

/*!
Module with all the code for the ESFTree, the tree used for the ESF Views.

It's similar to the PackTree, but modified for the requeriments of the ESF files.
!*/

use qt_widgets::QTreeView;
use qt_widgets::q_header_view::ResizeMode;

use qt_gui::QStandardItem;
use qt_gui::QStandardItemModel;
use qt_gui::QListOfQStandardItem;

use qt_core::QModelIndex;
use qt_core::QVariant;
use qt_core::QBox;
use qt_core::ItemFlag;
use qt_core::QFlags;
use qt_core::QSortFilterProxyModel;
use qt_core::QString;
use qt_core::QPtr;

use cpp_core::CppBox;
use cpp_core::Ptr;

use rpfm_lib::packedfile::esf::{ESF, NodeType};

const ESF_DATA: i32 = 40;
const CHILDLESS_NODE: i32 = 41;
const CHILD_NODES: i32 = 42;

//-------------------------------------------------------------------------------//
//                          Enums & Structs (and trait)
//-------------------------------------------------------------------------------//

/// This trait adds multiple util functions to the `TreeView` you implement it for.
///
/// Keep in mind that this trait has been created with `ESF TreeView's` in mind, so his methods
/// may not be suitable for all purposes.
pub(crate) trait ESFTree {

    /// This function gives you the items selected in the provided `TreeView`.
    unsafe fn get_items_from_selection(&self, has_filter: bool) -> Vec<Ptr<QStandardItem>>;

    /// This function generates an ESF file from the contents of the `TreeView`.
    unsafe fn get_esf_from_view(&self, has_filter: bool) -> ESF;

    /// This function takes care of EVERY operation that manipulates the provided TreeView.
    /// It does one thing or another, depending on the operation we provide it.
    unsafe fn update_treeview(&self, has_filter: bool, operation: ESFTreeViewOperation);
}

/// This enum has the different possible operations we can do in a `TreeView`.
#[derive(Clone, Debug)]
pub enum ESFTreeViewOperation {

    /// Build the entire `TreeView` from the provided ESF data.
    Build(ESF),
}

//-------------------------------------------------------------------------------//
//                      Implementations of `ESFTree`
//-------------------------------------------------------------------------------//

/// Implementation of `ESFTree` for `QPtr<QTreeView>.
impl ESFTree for QBox<QTreeView> {

    unsafe fn get_items_from_selection(&self, has_filter: bool) -> Vec<Ptr<QStandardItem>> {
        let filter: Option<QPtr<QSortFilterProxyModel>> = if has_filter { Some(self.model().static_downcast()) } else { None };
        let model: QPtr<QStandardItemModel> = if let Some(ref filter) = filter { filter.source_model().static_downcast() } else { self.model().static_downcast()};

        let indexes_visual = self.selection_model().selection().indexes();
        let mut indexes_visual = (0..indexes_visual.count_0a()).rev().map(|x| indexes_visual.take_at(x)).collect::<Vec<CppBox<QModelIndex>>>();
        indexes_visual.reverse();
        let indexes_real = if let Some(filter) = filter {
            indexes_visual.iter().map(|x| filter.map_to_source(x.as_ref())).collect::<Vec<CppBox<QModelIndex>>>()
        } else {
            indexes_visual
        };

        indexes_real.iter().map(|x| model.item_from_index(x.as_ref())).collect()
    }

    unsafe fn update_treeview(&self, has_filter: bool, operation: ESFTreeViewOperation) {
        let filter: Option<QPtr<QSortFilterProxyModel>> = if has_filter { Some(self.model().static_downcast()) } else { None };
        let model: QPtr<QStandardItemModel> = if let Some(ref filter) = filter { filter.source_model().static_downcast() } else { self.model().static_downcast() };

        // We act depending on the operation requested.
        match operation {

            // If we want to build a new TreeView...
            ESFTreeViewOperation::Build(esf_data) => {

                // First, we clean the TreeStore and whatever was created in the TreeView.
                model.clear();

                // Second, we set as the big_parent, the base for the folders of the TreeView, a fake folder
                // with the name of the PackFile. All big things start with a lie.
                let root_node = esf_data.get_ref_root_node();
                match root_node {
                    NodeType::Record(node) => {

                        let big_parent = QStandardItem::from_q_string(&QString::from_std_str(&node.get_ref_name()));
                        let state_item = QStandardItem::new();
                        big_parent.set_editable(false);
                        state_item.set_editable(false);
                        state_item.set_selectable(false);

                        let esf_data_no_node: ESF = esf_data.clone_without_root_node();
                        big_parent.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(&serde_json::to_string_pretty(&esf_data_no_node).unwrap())), ESF_DATA);
                        big_parent.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(&serde_json::to_string_pretty(&root_node.clone_without_children()).unwrap())), CHILDLESS_NODE);
                        big_parent.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(&serde_json::to_string_pretty(&node.get_ref_children()[0].iter().map(|x| x.clone_without_children()).collect::<Vec<NodeType>>()).unwrap())), CHILD_NODES);

                        let flags = ItemFlag::from(state_item.flags().to_int() & ItemFlag::ItemIsSelectable.to_int());
                        state_item.set_flags(QFlags::from(flags));

                        for node_group in node.get_ref_children() {
                            for node in node_group {
                                load_node_to_view(&big_parent, node, None);
                            }
                        }

                        // Delay adding the big parent as much as we can, as otherwise the signals triggered when adding a PackedFile can slow this down to a crawl.
                        let qlist = QListOfQStandardItem::new();
                        qlist.append_q_standard_item(&big_parent.into_ptr().as_mut_raw_ptr());
                        qlist.append_q_standard_item(&state_item.into_ptr().as_mut_raw_ptr());

                        model.append_row_q_list_of_q_standard_item(qlist.as_ref());
                        self.header().set_section_resize_mode_2a(0, ResizeMode::Stretch);
                        self.header().set_section_resize_mode_2a(1, ResizeMode::Interactive);
                        self.header().set_minimum_section_size(4);
                        self.header().resize_section(1, 4);
                    }
                    _ => {}
                }
            },
        }
    }

    unsafe fn get_esf_from_view(&self, has_filter: bool) -> ESF {
        let filter: Option<QPtr<QSortFilterProxyModel>> = if has_filter { Some(self.model().static_downcast()) } else { None };
        let model: QPtr<QStandardItemModel> = if let Some(ref filter) = filter { filter.source_model().static_downcast() } else { self.model().static_downcast() };

        let mut new_esf: ESF = serde_json::from_str(&model.item_1a(0).data_1a(ESF_DATA).to_string().to_std_string()).unwrap();
        new_esf.set_root_node(get_node_type_from_tree_node(None, &model));

        // Return the created ESF.
        // TODO: check this returns the exact same ESF if there are no changes.
        new_esf
    }
}

/// This function takes care of recursively loading all the nodes into the `TreeView`.
unsafe fn load_node_to_view(parent: &CppBox<QStandardItem>, child: &NodeType, block_key: Option<&str>) {
    match child {
        NodeType::Record(node) => {
            let child_item = QStandardItem::from_q_string(&QString::from_std_str(node.get_ref_name()));
            let state_item = QStandardItem::new();
            state_item.set_selectable(false);

            if let Some(block_key) = block_key {
                child_item.set_text(&QString::from_std_str(block_key));
            }

            let mut childs_data_2: Vec<Vec<NodeType>> = vec![];

            for grandchildren in node.get_ref_children() {
                let grandchild_item = QStandardItem::from_q_string(&QString::from_std_str(node.get_ref_name()));
                let grandstate_item = QStandardItem::new();
                grandstate_item.set_selectable(false);

                for grandchild in grandchildren {
                    match grandchild {
                        NodeType::Record(_) => load_node_to_view(&grandchild_item, &grandchild, None),
                        _ => {}
                    }
                }

                grandchild_item.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(serde_json::to_string_pretty(&child.clone_without_children()).unwrap())), CHILDLESS_NODE);
                grandchild_item.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(serde_json::to_string_pretty(&grandchildren.iter().map(|x| x.clone_without_children()).collect::<Vec<NodeType>>()).unwrap())), CHILD_NODES);

                let qlist = QListOfQStandardItem::new();
                qlist.append_q_standard_item(&grandchild_item.into_ptr().as_mut_raw_ptr());
                qlist.append_q_standard_item(&grandstate_item.into_ptr().as_mut_raw_ptr());

                child_item.append_row_q_list_of_q_standard_item(qlist.as_ref());

                childs_data_2.push(grandchildren.iter().map(|x| x.clone_without_children()).collect());
            }
            child_item.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(serde_json::to_string_pretty(&child.clone_without_children()).unwrap())), CHILDLESS_NODE);
            child_item.set_data_2a(&QVariant::from_q_string(&QString::from_std_str(serde_json::to_string_pretty(&childs_data_2).unwrap())), CHILD_NODES);

            let qlist = QListOfQStandardItem::new();
            qlist.append_q_standard_item(&child_item.into_ptr().as_mut_raw_ptr());
            qlist.append_q_standard_item(&state_item.into_ptr().as_mut_raw_ptr());

            parent.append_row_q_list_of_q_standard_item(qlist.as_ref());
        }
        _ => {}
    }
}

/// This function reads the entire `TreeView` recursively and returns a node list.
unsafe fn get_node_type_from_tree_node(current_item: Option<Ptr<QStandardItem>>, model: &QStandardItemModel) -> NodeType {

    let item = if let Some(item) = current_item { item } else { model.item_1a(0) };
    let mut node = serde_json::from_str(&item.data_1a(CHILDLESS_NODE).to_string().to_std_string()).unwrap();

    // If it has no children, just its json.
    match node {
        NodeType::Record(ref mut node) => {

            // Get the stashed children.
            let child_nodes = item.data_1a(CHILD_NODES).to_string().to_std_string();
            let mut children_stash: Vec<Vec<NodeType>> = if !child_nodes.is_empty() {
                match serde_json::from_str(&child_nodes) {
                    Ok(data) => data,
                    Err(error) => { dbg!(error); vec![]},
                }
            } else {
                vec![]
            };

            // Get the stacked children.
            let children_count = item.row_count();
            let mut children_stack = Vec::with_capacity(children_count as usize);
            for row in 0..children_count {
                let child = item.child_1a(row);
                children_stack.push(get_node_type_from_tree_node(Some(child), model));
            }

            // If it's not the root node, and we have stacked children, move the stacked data into the stashed children.
            if current_item.is_some() && !children_stack.is_empty() {
                let mut row = 0;

                for children_stash_pack in children_stash.iter_mut() {
                    for child_stashed in children_stash_pack.iter_mut() {
                        match child_stashed {
                            NodeType::Record(_) => {
                                let child_item = item.child_1a(row);
                                *child_stashed = get_node_type_from_tree_node(Some(child_item), model);
                                row += 1;
                            },
                            _ => {},
                        }
                    }
                }
            } else if current_item.is_none() {
                children_stash = vec![children_stack];
            }

            node.set_children(children_stash);
        },
        _ => unimplemented!()
    }
    node
}
