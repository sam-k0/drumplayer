# drumplayer

A feature incomplete, experimental player for .tja files.

Provides a basic song browser and gameplay experience.

# Controls
Not configurable yet, but:
- F/G : Back/Confirm || Don left/right
- J/K : Up/Down || Katsu left/right

# Song browser features
- [x] List of detected songs
- [x] Difficulty detection
- [ ] Difficulty support (currently only 1 per file)
- [x] Play selected songs
- [x] Rainbow animation in bg

# File format features
A list of features can be found [here](https://github.com/269Seahorse/Better-taiko-web/blob/master/TJA-format.mediawiki).

- [x] TITLE metadata
- [x] SUBTITLE metadata
- [x] OFFSET metadata
- [x] BPM metadata
- [x] Standard notes (Don/Katsu)
- [x] #SCROLL modifier
- [ ] #BPMCHANGE (*kinda* working)
- [ ] Subtitles
- [ ] Drumrolls

... and many more missing

![screenshot](img/game.png)

# Platform Support
Made in GameMaker 2.3, developed on Ubuntu.

Should support VM/YYC on Windows as well.
