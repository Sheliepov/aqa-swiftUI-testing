//
//  TaskTableViewCell.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "TaskTableViewCell.h"


@interface TaskTableViewCell ()

@property (nonatomic) BOOL isTextHighlighted;
@property (nonatomic) BOOL isNonSemanticTextColor;
@property (nonatomic) BOOL isImageHighlighted;

@end

@implementation TaskTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (nil != self) {
        self.textLabel.font = [UIFont systemFontOfSize:16];
        self.imageView.accessibilityIdentifier = @"cell_image_view";
        
        [self updateTextColor];
        [self updateImage];
    }
    
    return self;
}

- (void)setIsCompleted:(BOOL)isCompleted {
    [self setIsTextHighlighted:isCompleted];
    [self setIsImageHighlighted:isCompleted];
}

- (void)setIsTextHighlighted:(BOOL)isTextHighlighted {
    if (_isTextHighlighted == isTextHighlighted) {
        return;
    }
    
    _isTextHighlighted = isTextHighlighted;
    
    [self updateTextColor];
}

- (void)setIsNonSemanticTextColor:(BOOL)isNonSemanticTextColor {
    if (_isNonSemanticTextColor == isNonSemanticTextColor) {
        return;
    }
    
    _isNonSemanticTextColor = isNonSemanticTextColor;
    
    [self updateTextColor];
}

- (void)updateTextColor {
    UIColor *highlightedColor = self.isNonSemanticTextColor ? [UIColor colorWithWhite:140. / 255. alpha:1] : UIColor.secondaryLabelColor;
    UIColor *regularColor = self.isNonSemanticTextColor ? UIColor.blackColor : UIColor.labelColor;

    self.textLabel.textColor = self.isTextHighlighted ? highlightedColor : regularColor;
}

- (void)setIsImageHighlighted:(BOOL)isImageHighlighted {
    if (_isImageHighlighted == isImageHighlighted) {
        return;
    }
    
    _isImageHighlighted = isImageHighlighted;
    
    [self updateImage];
}

- (void)updateImage {
    NSString *imageName = self.isImageHighlighted ? @"Checkbox-Checked" : @"Checkbox-Empty";
    NSString *accessibilityLabel = self.isImageHighlighted ? @"Selected" : @"Not selected";
    self.imageView.image = [UIImage imageNamed:imageName];
    self.imageView.accessibilityValue = accessibilityLabel;
}

@end
