\include "header.ly"
\include "melody.ly"
\include "chords.ly"
\include "2.ly"
\include "bass.ly"

#(set-accidental-style 'modern-cautionary)
%\unfoldRepeats{
\transpose c' b {
%\transpose c' c' {
	\new StaffGroup <<
		\time 2/2
		\new ChordNames \chordsfour
		\new Staff {\clef violin \melodyfour}
		\new Staff \with {
			instrumentName = "Klarinette"
		} \transpose b c' <<
			{\clef violin \melodyfour}
		>>
		\new Staff {\clef alto \twofour}

	%	\new Staff {\bassfour}
	>>
}
%}

intermediatechords = \chordmode {
	fis1:7 | cis:7 | fis:9
}
\new StaffGroup <<
	\new ChordNames \chordmode {
			\germanChords
			\set chordNameLowercaseMinor = ##t
			\set chordChanges = ##t
			\set noChordSymbol = ""
			\intermediatechords

	}
\new Staff \chordmode {
		\germanChords
		\set chordNameLowercaseMinor = ##t
		\set chordChanges = ##t
		\set noChordSymbol = ""
		\intermediatechords
}
>>

\new StaffGroup <<
	\time 3/4
	\new ChordNames \chordsthree
	\new Staff \melodythree
	\new Staff \with {
		instrumentName = "Klarinette"
	} \transpose b c' <<
		{\clef violin \melodythree}
	>>
	%\new Staff \bassthree
>>

