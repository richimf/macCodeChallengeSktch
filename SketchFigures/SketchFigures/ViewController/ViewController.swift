//    func updateInspector(data: Shape) {
//        guard let splitViewController = self.parent as? NSSplitViewController,
//              let inspectoVC = self.storyboard?.instantiateController(withIdentifier: "inspectorID") as? InspectorViewController
//                      else { return }
//        //let item = NSSplitViewItem(viewController: inspectoVC)
//        guard let ivc = splitViewController.presentedViewControllers?.first as? InspectorViewController else { return }
//        //var items = splitViewController.splitViewItems
//        //items[1] = item
//        //splitViewController.splitViewItems = items
//        ivc.data = data
//        ivc.updateInspectorData()
//    }
//extension ViewController: DataSelectedDelegate {
//    func selected(shape: Shape) {
//        <#code#>
//    }
//}
