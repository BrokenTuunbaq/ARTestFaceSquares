import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [newViewController(controllerName: "Page1onboardViewController"), newViewController(controllerName: "Page2onboardViewController"), newViewController(controllerName: "Page3onboardViewController")]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }

    func newViewController(controllerName: String) -> UIViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: controllerName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 230/255.0, green: 136/255.0, blue: 169/255.0, alpha: 1)
        dataSource = self
        delegate = self
        setViewControllers([orderedViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}
