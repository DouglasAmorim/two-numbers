//
//  ContentView.swift
//  Two-Numbers
//
//  Created by Douglas Amorim on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    
    func test() {
        let l1 = ListNode(2, nil)
        let l21 = ListNode(9, nil)
        let l22 = ListNode(2, l21)
        
        TwoNumbers()
            .recursiveApproach(l1, l22)
    }
    
    var body: some View {
        VStack {
            Button("teste", role: .none, action: {
                test()
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
