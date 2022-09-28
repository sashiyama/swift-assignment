class ServiceProvider {
    func provide() {}
}

protocol CarRepairServiceProviderDelegate: AnyObject {
    func serviceDidStart(_ service: CarRepairServiceProvider)
    func service(_ service: CarRepairServiceProvider) -> Bool
    func serviceDidEnd(_ service: CarRepairServiceProvider)
}

class CarRepairServiceProvider: ServiceProvider {
    var descriptionIssue: String
    var carModel: String
    weak var delegate: CarRepairServiceProviderDelegate?

    init(descriptionIssue: String, carModel: String) {
        self.descriptionIssue = descriptionIssue
        self.carModel = carModel
    }

    override func provide() {
        delegate?.serviceDidStart(self)

        guard let isFixed = delegate?.service(self) else {
            return
        }

        if isFixed {
            print("Fixed: \(self.carModel)")
        } else {
            print("Could not fix: \(self.carModel)")
        }

        delegate?.serviceDidEnd(self)
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

protocol HomeServiceProviderDelgate: AnyObject {
    func serviceDidStart(_ service: HomeServiceProvider)
    func service(_ service: HomeServiceProvider)
    func serviceDidEnd(_ service: HomeServiceProvider)
}

class HomeServiceTracker: HomeServiceProviderDelgate {
    func serviceDidStart(_ service: HomeServiceProvider) {
        print("Arrived at \(service.address)")
    }

    func service(_ service: HomeServiceProvider) {
        print("Doing \(service.serviceType)")
    }

    func serviceDidEnd(_ service: HomeServiceProvider) {
        print("End \(service.serviceType)")
    }
}

class HomeServiceProvider: ServiceProvider {
    var serviceType: HomeService
    var address: String
    weak var delegate: HomeServiceProviderDelgate?

    init(serviceType: HomeService, address: String) {
        self.serviceType = serviceType
        self.address = address
    }

    override func provide() {
        guard let delegate = self.delegate else {
            return
        }

        delegate.serviceDidStart(self)
        delegate.service(self)
        delegate.serviceDidEnd(self)
    }
}

protocol StudentServiceDelegate: AnyObject {
    func serviceDidStart(_ service: StudentServiceProvider)
    func service(_ service: StudentServiceProvider)
    func serviceDidEnd(_ service: StudentServiceProvider)
}

class StudentService: StudentServiceDelegate {
    func serviceDidStart(_ service: StudentServiceProvider) {
        print("Start \(service.description)")
    }

    func service(_ service: StudentServiceProvider) {
        print("Doing \(service.description)")
    }

    func serviceDidEnd(_ service: StudentServiceProvider) {
        print("End \(service.description)")
    }
}

class StudentServiceProvider: ServiceProvider {
    var description: String
    weak var delegate: StudentServiceDelegate?

    init(description: String) {
        self.description = description
    }

    override func provide() {
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
        provider.provide()
    }

    func askHomeServiceProvider(serviceType: HomeService, address: String) {
        let provider = HomeServiceProvider(serviceType: serviceType, address: address)
        let delegate = HomeServiceTracker()
        provider.delegate = delegate
        provider.provide()
    }

    func askStudentServiceProvider(description: String) {
        let provider = StudentServiceProvider(description: description)
        let delegate = StudentService()
        provider.delegate = delegate
        provider.provide()
    }
}

func main() {
    print("When client A is interested in a car repair service")
    let clientA = ClientA(descriptionIssue: "Need to blow up tires", carModel: "Super car")
    let carRepairServiceProvider = CarRepairServiceProvider(descriptionIssue: clientA.descriptionIssue, carModel: clientA.carModel)
    let carRepair = CarRepair()
    carRepairServiceProvider.delegate = carRepair
    carRepairServiceProvider.provide()
    print()

    print("When client B is interested in a home service")
    let clientB = ClientB(selectedServiceType: .CookingService, address: "3049 Champlain Square, Vancouver, BC")
    let homeServiceProvider = HomeServiceProvider(serviceType: clientB.selectedServiceType, address: clientB.address)
    let homeServiceProviderDelegate = HomeServiceTracker()
    homeServiceProvider.delegate = homeServiceProviderDelegate
    homeServiceProvider.provide()
    print()

    print("When client C is interested in a student service")
    let clientC = ClientC(description: "Need to get my student ID")
    let studentServiceProvider = StudentServiceProvider(description: clientC.description)
    let studentService = StudentService()
    studentServiceProvider.delegate = studentService
    studentServiceProvider.provide()
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
