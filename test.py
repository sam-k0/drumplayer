def calcNoteScrollSpeed(__rowlen_px, __upper, __bpm):

    pxperbeat = __rowlen_px / __upper
    pxperframe = pxperbeat * __bpm
    return pxperframe * 0.333333


print(calcNoteScrollSpeed(768, 8, 666))