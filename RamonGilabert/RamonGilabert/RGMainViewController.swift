import UIKit

struct Constant {
    struct Setup {
        static let NumberOfPagesScrolling = 3 as Int
    }
}

class RGMainViewController: UIViewController {

    let deviceWidth = UIScreen.mainScreen().bounds.width
    let deviceHeight = UIScreen.mainScreen().bounds.height
    var scrollView = UIScrollView()
    var arrayWithControllers = []

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = UIScrollView(frame: CGRectMake(0, 0, self.deviceWidth, self.deviceHeight))
        self.scrollView.contentSize = CGSizeMake(self.deviceWidth * CGFloat(Constant.Setup.NumberOfPagesScrolling), self.deviceHeight)
        self.scrollView.backgroundColor = UIColor.whiteColor()
        self.scrollView.pagingEnabled = true
        self.view.addSubview(self.scrollView)
    }

    // MARK: ScrollView methods

    func loadScrollViewInPage(page: Int) {
        if page >= Constant.Setup.NumberOfPagesScrolling {
            return
        }

        let viewController = self.arrayWithControllers[page] as? UIViewController

    }
}

//- (void)loadScrollViewWithPage:(NSUInteger)page
//{
//    if (page >= self.numberOfPages) return;
//
//    UIView *view = [self.arrayWithSlides objectAtIndex:page];
//
//    if ((NSNull *)view == [NSNull null]) {
//        view = [UIView new];
//        [self.arrayWithSlides replaceObjectAtIndex:page withObject:view];
//    }
//
//    if (view.superview == nil)
//    {
//        CGRect frame = self.frame;
//        frame.origin.x = CGRectGetWidth(frame) * page;
//        frame.origin.y = 0;
//        view.frame = frame;
//
//        [self addSubview:view];
//    }
//
//    if ((int)(page + 1) == (int)self.arrayWithSlides.count) {
//        if (!self.buttonDismiss) {
//            self.buttonDismiss = [[UIButton alloc] initWithFrame:CGRectMake(50, self.deviceHeight - self.deviceHeight/5.5, self.deviceWidth - 100, 65)];
//            self.buttonDismiss.layer.cornerRadius = 7.5;
//            self.buttonDismiss.layer.borderColor = [UIColor darkGrayColor].CGColor;
//            self.buttonDismiss.layer.borderWidth = 2;
//            self.buttonDismiss.titleLabel.font = [UIFont fontWithName:@"Avenir" size:26];
//            [self.buttonDismiss setTitle:@"Start this journey" forState:UIControlStateNormal];
//            [self.buttonDismiss setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//            [self.buttonDismiss addTarget:self action:@selector(onDismissButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//            self.buttonDismiss.alpha = 0;
//            [view addSubview:self.buttonDismiss];
//        }
//    }
//}
