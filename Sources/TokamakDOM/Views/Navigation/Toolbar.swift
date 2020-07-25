// Copyright 2020 Tokamak contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Created by Carson Katri on 7/7/20.
//

import TokamakCore

public typealias ToolbarItem = TokamakCore.ToolbarItem
public typealias ToolbarItemPlacement = TokamakCore.ToolbarItemPlacement
public typealias ToolbarItemGroup = TokamakCore.ToolbarItemGroup

extension ToolbarItem: ViewDeferredToRenderer {
  public var deferredBody: AnyView {
    switch _ToolbarItemProxy(self).placement {
    case .navigation:
      return AnyView(HTML("div", ["class": "_tokamak-toolbar-container-toolbar-item-navigation"]) {
        _ToolbarItemProxy(self).content
      })
    default:
      return AnyView(HTML("div", ["class": "_tokamak-toolbar-container-toolbar-item"]) {
        _ToolbarItemProxy(self).content
      })
    }
  }
}

extension _ToolbarContainer: ViewDeferredToRenderer where Content: View {
  public var deferredBody: AnyView {
    AnyView(HTML("div", ["class": "_tokamak-toolbar-container"]) {
      HTML("div", ["class": "_tokamak-toolbar-container-toolbar"]) {
        title
        content
      }
      HTML("div", ["class": "_tokamak-toolbar-container-content"]) {
        child
      }
    })
  }
}