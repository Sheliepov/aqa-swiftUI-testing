//
//  Macros.h
//  Tasks
//
//  Created by Evgeny on 16.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#define RDWeakifySelf RDWeakifyWithName(self, weakSelf)
#define RDWeakifyWithName(reference, weakReferenceName) __block __typeof(reference) const weakReferenceName = reference

#define RDStrongifySelf RDStrongifyWithName(weakSelf, strongSelf)
#define RDStrongifyWithName(reference, strongReferenceName) __typeof(reference) const strongReferenceName = reference

#define RDStrongifySelfAndReturnIfNil \
RDStrongifyWithName(weakSelf, strongSelf); \
if (nil == strongSelf) { \
    return; \
} \

