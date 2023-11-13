//
//  TaskTableViewCell.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface TaskTableViewCell : UITableViewCell

- (void)setIsTextHighlighted:(BOOL)isTextHighlighted;
- (void)setIsCompleted:(BOOL)isCompleted;
- (void)setIsNonSemanticTextColor:(BOOL)isNonSemanticTextColor;

@end

NS_ASSUME_NONNULL_END
