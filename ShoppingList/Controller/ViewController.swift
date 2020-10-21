//
//  ViewController.swift
//  ShoppingList
//
//  Created by Kellyane Nogueira on 16/10/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var products: [Product] = []
    var count: Int16 = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProduct()
        saveProduct()
    }
    
    func fetchProduct() {
        do {
            let request = Product.fetchRequest() as NSFetchRequest<Product>
            
            //Set the filtering and sorting on the request
            let pred = NSPredicate(format: "id CONTAINS '1'")
            request.predicate = pred
            self.products = try context.fetch(request)
            showShopping()
            
        } catch {
            
        }
    }
    
    func saveProduct() {
        // Creating a product object
        let newProduct = Product(context: self.context)
        print("Write the product's name: \n")
        newProduct.name = "sabonete" //readLine()
        newProduct.price = 3.65
        newProduct.quantity = 2
//        print("Write the product's price: \n")
//        newProduct.price = readLine()
//        print("Write the product's quantity: \n")
//        newProduct.quantity = readLine()
        newProduct.id = count+1
       
        // Save the data
        do {
            try self.context.save()
        } catch {
            print("Error")
        }
        
        // Re-fetch the data
        self.fetchProduct()
    }
    
    func editProduct(id: Int16) {
        for product in products {
            if id == product.id {
                // TODO: receber as novas informações
                try! self.context.save()
            }
        }
        
        self.fetchProduct()
    }
    
    func deleteProduct(id: Int16) {
        for product in products {
            if id == product.id {
                self.context.delete(product)
            }
        }
        
        self.fetchProduct()
    }
    
    func showShopping() {
        for product in products {
            print("\(product.id). \(product.name)")
        }
    }


}

