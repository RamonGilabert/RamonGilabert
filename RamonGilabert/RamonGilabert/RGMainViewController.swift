import UIKit

class RGMainViewController: UIViewController, UIScrollViewDelegate {
    
    let viewModel = ViewModel()
    var scrollView = UIScrollView()
    var arrayWithControllers = NSMutableArray()

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView = self.viewModel.initMainScrollViewInView(view)
        self.scrollView.delegate = self

        for index in 0...2 {
            self.arrayWithControllers.addObject(NSNull())
        }

        loadScrollViewInPage(0)
        loadScrollViewInPage(1)
    }

    // MARK: ScrollView methods

    func loadScrollViewInPage(page: Int) {

        if page >= Constant.Setup.NumberOfPagesScrolling || page <= -1 {
            return
        }

        let viewController = self.arrayWithControllers[page] as? UIViewController

        if !(viewController != nil) {
            if page == 0 {
                loadViewController(RGStoryViewController(), page: page)
            } else if page == 1 {
                loadViewController(RGSkillsViewController(), page: page)
            } else {
                loadViewController(RGProjectsViewController(), page: page)
            }
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = CGRectGetWidth(self.scrollView.frame)
        let page = Int(floor(((self.scrollView.contentOffset.x - Constant.Size.DeviceWidth) / 2) / Constant.Size.DeviceWidth + 1))

        loadScrollViewInPage(page - 1)
        loadScrollViewInPage(page + 1)
    }

//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//    {
//    self.scrollOffset = 0;
//
//    CGFloat pageWidth = CGRectGetWidth(self.frame);
//    NSUInteger page = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
//
//    if (self.pageToPerformFirstAnimation == (int)page && ![self.viewMain.subviews containsObject:self.imageViewThatMoves]) {
//    [self.viewMain addSubview:self.imageViewThatMoves];
//    self.imageViewThatMoves.alpha = 0;
//
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(0, 0);
//    [UIView animateWithDuration:0.3 animations:^{
//    self.imageViewThatMoves.alpha = 1;
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(1.2, 1.2);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:0.2 animations:^{
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(1, 1);
//    }];
//    }];
//    }
//
//    if ((int)page < self.pageToPerformFirstAnimation) {
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(1, 1);
//    [UIView animateWithDuration:0.2 animations:^{
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(1.1, 1.1);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:1.4 animations:^{
//    self.imageViewThatMoves.transform = CGAffineTransformMakeScale(0, 0);
//    self.imageViewThatMoves.alpha = 0;
//    } completion:^(BOOL finished) {
//    [self.imageViewThatMoves removeFromSuperview];
//    }];
//    }];
//    }
//
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//    [self loadScrollViewWithPage:page + 2];
//    [self loadScrollViewWithPage:page + 3];
//
//    if ([self.firstPageSecond intValue] == (int)page) {
//    [self.staticImageView removeFromSuperview];
//    } else if ([self.firstPageFirst intValue] == (int)page) {
//    [self.mainView addSubview:self.staticImageView];
//    self.staticImageView.alpha = 0;
//
//    if (self.animationStaticImage == 0) {
//    self.staticImageView.transform = CGAffineTransformMakeScale(0, 0);
//    [UIView animateWithDuration:0.3 animations:^{
//    self.staticImageView.alpha = 1;
//    self.staticImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:0.2 animations:^{
//    self.staticImageView.transform = CGAffineTransformMakeScale(1, 1);
//    }];
//    }];
//    } else if (self.animationStaticImage == 1) {
//    self.staticImageView.transform = CGAffineTransformMakeTranslation(10, -500);
//    [UIView animateWithDuration:0.3 animations:^{
//    self.staticImageView.alpha = 1;
//    self.staticImageView.transform = CGAffineTransformMakeTranslation(0, 20);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:0.2 animations:^{
//    self.staticImageView.transform = CGAffineTransformMakeTranslation(0, 0);
//    }];
//    }];
//    } else {
//    self.staticImageView.alpha = 1;
//    }
//
//    if ([self.mainView.subviews containsObject:self.staticImageViewSecond]) {
//    [self.staticImageViewSecond removeFromSuperview];
//    }
//    }
//
//    if ([self.secondPageFirst intValue] == (int)page && ![self.mainView.subviews containsObject:self.staticImageViewSecond]) {
//    [self.mainView addSubview:self.staticImageViewSecond];
//    self.staticImageViewSecond.alpha = 0;
//
//    if (self.animationStaticImageSecond == 0) {
//    self.staticImageViewSecond.transform = CGAffineTransformMakeScale(0, 0);
//    [UIView animateWithDuration:0.3 animations:^{
//    self.staticImageViewSecond.alpha = 1;
//    self.staticImageViewSecond.transform = CGAffineTransformMakeScale(1.2, 1.2);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:0.2 animations:^{
//    self.staticImageViewSecond.transform = CGAffineTransformMakeScale(1, 1);
//    }];
//    }];
//    } else if (self.animationStaticImageSecond == 1) {
//    self.staticImageViewSecond.transform = CGAffineTransformMakeTranslation(10, -500);
//    [UIView animateWithDuration:0.3 animations:^{
//    self.staticImageViewSecond.alpha = 1;
//    self.staticImageViewSecond.transform = CGAffineTransformMakeTranslation(0, 20);
//    } completion:^(BOOL finished) {
//    [UIView animateWithDuration:0.2 animations:^{
//    self.staticImageViewSecond.transform = CGAffineTransformMakeTranslation(0, 0);
//    }];
//    }];
//    } else {
//    self.staticImageViewSecond.alpha = 1;
//    }
//    } else if ([self.secondPageSecond intValue] == (int)page) {
//    [self.staticImageViewSecond removeFromSuperview];
//    }
//    }


    // MARK: Helper methods

    func loadViewController(viewController: UIViewController, page: Int) {
        viewController.view.frame = CGRectMake(viewController.view.bounds.width * CGFloat(page), 0, viewController.view.bounds.width, viewController.view.bounds.height)

        self.addChildViewController(viewController)
        self.scrollView.addSubview(viewController.view)

        self.arrayWithControllers.replaceObjectAtIndex(page, withObject: viewController)
    }
}
