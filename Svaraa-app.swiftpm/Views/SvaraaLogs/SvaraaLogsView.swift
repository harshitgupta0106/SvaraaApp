//
//  SwiftUIView.swift
//  Florie-app
//
//  Created by Harshit Gupta on 06/02/25.
//

import SwiftUI

struct SvaraaLogsView: View {
    var body: some View {
        NavigationStack {
            CheckListView()
                .navigationTitle("Daily Health Checklist")
        }
    }
}

#Preview {
    SvaraaLogsView()
}
