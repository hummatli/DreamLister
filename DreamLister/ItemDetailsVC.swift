//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Settar Hummetli on 7/20/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerStore: UIPickerView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var tfDetails: UITextField!
    
    var stores = [Store]()
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        pickerStore.dataSource = self
        pickerStore.delegate = self
        
        
//        let store = Store(context: context)
//        store.name = "Best Buy"
//        
//        let store2 = Store(context: context)
//        store2.name = "Tesla Dealership"
//        
//        let store3 = Store(context: context)
//        store3.name = "Frys Electronics"
//        
//        let store4 = Store(context: context)
//        store4.name = "Target"
//        
//        let store5 = Store(context: context)
//        store5.name = "Amazon"
//        
//        let store6 = Store(context: context)
//        store6.name = "K Mart"
//        
//        ad.saveContext()
    
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Update when selected
    }
    
    
    func getStores() {
     
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
            self.stores = try context.fetch(fetchRequest)
            self.pickerStore.reloadAllComponents()
            
        } catch {
            //hadle the error
        }
        
    }
    
    @IBAction func btnSavedItemPressed(_ sender: UIButton) {
        
        var item: Item!
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit
        }
        
        if let title = tfTitle.text {
            item.title = title
        }
        
        if let price = tfPrice.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let details = tfDetails.text {
            item.details = details
        }
        
        item.toStore = stores[pickerStore.selectedRow(inComponent: 0)]
        
        
        ad.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            tfTitle.text = item.title
            tfPrice.text = "\(item.price)"
            tfDetails.text = item.details
            
            if let store = item.toStore {
                
                for s in stores {
                    if s.name == store.name {
                        pickerStore.selectRow(stores.index(of: s)!, inComponent: 0, animated: false)
                        break
                    }
                }
            }
            
        }
        
    }
    
}
