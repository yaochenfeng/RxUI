@_exported import RxSwift
@_exported import RxCocoa

public extension Reactive where Base: AnyObject {
    func then(_ block: (Base) throws -> Void) rethrows -> Base {
        try block(self.base)
        return self.base
    }
}
public extension Reactive where Base: UIView {
    /// 根据视图找到对应的控制器
    var controller: UIViewController? {
        for view in sequence(first: base.superview, next: { $0?.superview }) {
            if let responder = view?.next, responder.isKind(of: UIViewController.self) {
                return responder as? UIViewController
            }
        }
        return nil
    }
    /// 添加多个视图
    func addSubview(_ views: [UIView]) {
        views.forEach{ base.addSubview($0) }
    }
}
public extension Reactive where Base: UIViewController {
    /// 当前顶层可视控制器
    static func topVisible(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let presentedViewController = viewController?.presentedViewController {
            return self.topVisible(presentedViewController)
        }
        // UITabBarController
        if let tabBarController = viewController as? UITabBarController,
           let selectedViewController = tabBarController.selectedViewController {
            return self.topVisible(selectedViewController)
        }
        // UINavigationController
        if let navigationController = viewController as? UINavigationController,
           let visibleViewController = navigationController.visibleViewController {
            return self.topVisible(visibleViewController)
        }
        // UIPageController
        if let pageViewController = viewController as? UIPageViewController,
           pageViewController.viewControllers?.count == 1 {
            return self.topVisible(pageViewController)
        }
        return viewController
    }
}
