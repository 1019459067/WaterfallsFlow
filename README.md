# WaterfallsFlow
一个简单的UICollectionView瀑布流布局演示demo（根据图片高度来确定）

#动画效果的实现
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UILabel *noteLabel = [[UILabel alloc]init];
        noteLabel.bounds = CGRectMake(0, 0, size.width , size.height);
        noteLabel.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * (1-0.618));
        noteLabel.backgroundColor = [UIColor blackColor];
        noteLabel.alpha = 1;
        noteLabel.textColor = [UIColor whiteColor];
        noteLabel.textAlignment = NSTextAlignmentCenter;
        noteLabel.font = [UIFont systemFontOfSize:15.0f];
        noteLabel.text = name;
        [self.view addSubview:noteLabel];
        
        [UIView animateWithDuration:2.0 animations:^{
            noteLabel.alpha = 0;
        }completion:^(BOOL finished) {
            [noteLabel removeFromSuperview];
        }];
    });
