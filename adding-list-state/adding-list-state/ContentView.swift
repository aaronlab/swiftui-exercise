//
//  ContentView.swift
//  adding-list-state
//
//  Created by Aaron Lee on 2020-10-14.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks = [Task]()
    
    @State var num = 1
    
    private func addTask() {
        self.tasks.append(Task(name: "Wash the car \(self.num)"))
        self.num += 1
    }
    
    var body: some View {

        List {
            
            Button(action: addTask) {
                Text("Add Task")
            }
            
            ForEach(tasks) { task in
                Text(task.name)
            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
