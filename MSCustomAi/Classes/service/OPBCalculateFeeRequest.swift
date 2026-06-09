import OPBJARVIS

class OPBCalculateFeeRequest: OPBBaseRequest {
    var scanId: String = ""
    var orderAmount: String = ""

    override func baseUrl() -> String {
        return OPBNetworkManager.shared.baseUrl("nqrHost") ?? "https://gonggong-offline-transaction.opayweb.com"
    }

    override func requestUrl() -> String {
        return "/transactionQrCode/OfflineQrCodeFacade/calculateFee"
    }

    override func encryptType() -> OPBEncryptType {
        return .kong
    }

    override func requestArgument() -> Any? {
        return [
            "scanId": scanId,
            "orderAmount": [
                "currency": "NGN",
                "value": orderAmount
            ]
        ]
    }
}
