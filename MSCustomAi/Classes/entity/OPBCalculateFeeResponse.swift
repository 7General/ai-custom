import OPBJARVIS

class OPBCalculateFeeViewItem: OPBResponseModel {
    var code: String = ""
    var mapType: String = ""
    var value: String = ""
    var key: String = ""
    var desc: String = ""
}

class OPBCalculateFeeResponse: OPBResponseModel {
    var totalAmount: String = ""
    var preOrderDirect: String = ""
    var viewList: [OPBCalculateFeeViewItem] = []

    @objc static func modelContainerPropertyGenericClass() -> [String: Any]? {
        return [
            "viewList": OPBCalculateFeeViewItem.self
        ]
    }
}
