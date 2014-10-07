//
//  UnityPluginAdapter.m
//  Unity-iPhone
//
//  Created by Shubin Fedor on 02/10/14.
//
//

#import "ProcessorEngine.h"
#import "DictJsonSerializer.h"

extern "C" {
const char *dispatch(const char *strParams) {

    NSDictionary *dictParams = [DictJsonSerializer deserialize:strParams];
    if (dictParams == nil) {
        return nil;
    }

    NSDictionary *retDictParams = [[ProcessorEngine sharedInstance] proceed:dictParams];

    if (retDictParams == nil) {
        return nil;
    }

    return [DictJsonSerializer serialize:retDictParams];
}
}