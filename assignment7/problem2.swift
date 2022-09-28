protocol CarRepairService {
    var descriptionIssue: String { get set }
    var carModel: String { get set }
    func fix() -> Bool
}

protocol CarRepairServiceProviderDelegate: AnyObject {
    func serviceDidStart(_ service: CarRepairServiceProvider)
    func service(_ service: CarRepairServiceProvider) -> Bool
    func serviceDidEnd(_ service: CarRepairServiceProvider)
}

class CarRepairServiceProvider: CarRepairService {
    var descriptionIssue: String
    var carModel: String
    weak var delegate: CarRepairServiceProviderDelegate?

    init(descriptionIssue: String, carModel: String) {
        self.descriptionIssue = descriptionIssue
        self.carModel = carModel
    }

    func fix() -> Bool {
        delegate?.serviceDidStart(self)

        guard let isFixed = delegate?.service(self) else {
            return false
        }

        if isFixed {
            print("Fixed: \(self.carModel)")
        } else {
            print("Could not fix: \(self.carModel)")
        }

        delegate?.serviceDidEnd(self)

        return isFixed
    }
}

class CarRepair: CarRepairServiceProviderDelegate {
    func serviceDidStart(_ service: CarRepairServiceProvider) {
        print("Start to fix \(service.carModel)")
    }

    func service(_ service: CarRepairServiceProvider) -> Bool {
        return service.descriptionIssue.count < 100
    }

    func serviceDidEnd(_ service: CarRepairServiceProvider) {
        print("End a repair service.")
    }
}

enum HomeService: String {
    case CookingService, WashingService, BabySittingService
}

protocol HomeServiceProtocol {
    var serviceType: HomeService { get set }
    var address: String { get set }
}

protocol HomeServiceProviderDelgate: AnyObject {
    func serviceDidStart(_ service: HomeServiceProtocol)
    func service(_ service: HomeServiceProtocol)
    func serviceDidEnd(_ service: HomeServiceProtocol)
}

class HomeServiceTracker: HomeServiceProviderDelgate {
    func serviceDidStart(_ service: HomeServiceProtocol) {
        print("Arrived at \(service.address)")
    }

    func service(_ service: HomeServiceProtocol) {
        print("Doing \(service.serviceType)")
    }

    func serviceDidEnd(_ service: HomeServiceProtocol) {
        print("End \(service.serviceType)")
    }
}

class HomeServiceProvider: HomeServiceProtocol {
    var serviceType: HomeService
    var address: String
    weak var delegate: HomeServiceProviderDelgate?

    init(serviceType: HomeService, address: String) {
        self.serviceType = serviceType
        self.address = address
    }

    func start() {
        guard let delegate = self.delegate else {
            return
        }

        delegate.serviceDidStart(self)
        delegate.service(self)
        delegate.serviceDidEnd(self)
    }
}

protocol StudentServiceProviderProtocol {
    var description: String { get set }
}

protocol StudentServiceDelegate: AnyObject {
    func serviceDidStart(_ service: StudentServiceProviderProtocol)
    func service(_ service: StudentServiceProviderProtocol)
    func serviceDidEnd(_ service: StudentServiceProviderProtocol)
}

class StudentService: StudentServiceDelegate {
    func serviceDidStart(_ service: StudentServiceProviderProtocol) {
        print("Start \(service.description)")
    }

    func service(_ service: StudentServiceProviderProtocol) {
        print("Doing \(service.description)")
    }

    func serviceDidEnd(_ service: StudentServiceProviderProtocol) {
        print("End \(service.description)")
    }


}

class StudentServiceProvider: StudentServiceProviderProtocol {
    var description: String
    weak var delegate: StudentServiceDelegate?

    init(description: String) {
        self.description = description
    }

    func start() {
        guard let delegate = delegate else {
            return
        }

        delegate.serviceDidStart(self)
        delegate.service(self)
        delegate.serviceDidEnd(self)
    }
}

class ClientA {
    let descriptionIssue: String
    let carModel: String

    init(descriptionIssue: String, carModel: String) {
        self.descriptionIssue = descriptionIssue
        self.carModel = carModel
    }
}

class ClientB {
    let selectedServiceType: HomeService
    let address: String

    init(selectedServiceType: HomeService, address: String) {
        self.selectedServiceType = selectedServiceType
        self.address = address
    }
}

class ClientC {
    let description: String

    init(description: String) {
        self.description = description
    }
}

class ClientD {
    func askCarRepairServiceProvider(descriptionIssue: String, carModel: String) {
        let provider = CarRepairServiceProvider(descriptionIssue: descriptionIssue, carModel: carModel)
        let delegate = CarRepair()
        provider.delegate = delegate
        let _ = provider.fix()
    }

    func askHomeServiceProvider(serviceType: HomeService, address: String) {
        let provider = HomeServiceProvider(serviceType: serviceType, address: address)
        let delegate = HomeServiceTracker()
        provider.delegate = delegate
        provider.start()
    }

    func askStudentServiceProvider(description: String) {
        let provider = StudentServiceProvider(description: description)
        let delegate = StudentService()
        provider.delegate = delegate
        provider.start()
    }
}

func main() {
    print("When client A is interested in a car repair service")
    let clientA = ClientA(descriptionIssue: "Need to blow up tires", carModel: "Super car")
    let carRepairServiceProvider = CarRepairServiceProvider(descriptionIssue: clientA.descriptionIssue, carModel: clientA.carModel)
    let carRepair = CarRepair()
    carRepairServiceProvider.delegate = carRepair
    let _ = carRepairServiceProvider.fix()
    print()

    print("When client B is interested in a home service")
    let clientB = ClientB(selectedServiceType: .CookingService, address: "3049 Champlain Square, Vancouver, BC")
    let homeServiceProvider = HomeServiceProvider(serviceType: clientB.selectedServiceType, address: clientB.address)
    let homeServiceProviderDelegate = HomeServiceTracker()
    homeServiceProvider.delegate = homeServiceProviderDelegate
    homeServiceProvider.start()
    print()

    print("When client C is interested in a student service")
    let clientC = ClientC(description: "Need to get my student ID")
    let studentServiceProvider = StudentServiceProvider(description: clientC.description)
    let studentService = StudentService()
    studentServiceProvider.delegate = studentService
    studentServiceProvider.start()
    print()

    print("When client C is interested in all services")
    let clientD = ClientD()
    clientD.askCarRepairServiceProvider(descriptionIssue: "Need to fix battries", carModel: "Tesla")
    print()
    clientD.askHomeServiceProvider(serviceType: .WashingService, address: "4033 45th Ave, Vancouver, BC")
    print()
    clientD.askStudentServiceProvider(description: "Need to get my GPA")
}

main()
