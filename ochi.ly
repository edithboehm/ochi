\include "header.ly"
\include "melody.ly"
\include "chords.ly"
\include "2.ly"
\include "bass.ly"
\include "cajon.ly"

#(set-accidental-style 'modern-cautionary)
\transpose c' es % g moll Version 1 (tief)
%\transpose c' f % a moll Version 1,5
%\transpose c' as % c moll Version 2, vom fis startend
%\transpose c' b% d moll Version 3, vom gis startend
\new StaffGroup <<
		\time 4/4
		\new ChordNames \chordsfour
		%\new Staff {
			%\clef violin
			%\melodyfour
		%}
		\new Staff \with {
			instrumentName = \markup { "Klar." \concat{ B \teeny \raise #0.4 \flat } }
		} \transpose b c' {
			\tempo Slowfox 2 = 60
			\clef violin
			\melodyfour
		}
		\new DrumStaff {
			\cajonstaff
			\drummode {
				r2
				tt4\prall tt8. tt16 tt4\prall tt8. tt16
				tt8 tt r tt tt4 tt
			}
		}

		%	\new Staff {\bassfour}
	>>


\new DrumStaff {
	\cajonstaff
	\tempo \markup {
		\concat {
			"Quickstep ("
			\smaller \general-align #Y #DOWN \note #"4" #1
			" = "
			\smaller \general-align #Y #DOWN \note #"2" #1
			")"
		}
	}
	\drummode {
		tt4 tt tt tt8 tt ~ tt8 tt4 tt8 tt4 tt
		tt4 tt tt tt8 tt ~ tt8 tt4 tt8 %tt4 tt
	}
}

\layout {
  \context {
    \Staff \RemoveEmptyStaves
  }
}
\transpose c' es % g moll Version 1 (tief)
%\transpose c' f % a moll Version 1,5
%\transpose c' as % c moll Version 2, vom fis startend
%\transpose c' b% d moll Version 3, vom gis startend
\new StaffGroup <<
	\new ChordNames \chordsfour
	\new Staff {
		\clef violin
		\melodyfour
	}
	\new Staff \RemoveEmptyStaves {
		\clef alto \twofour
	}
>>



intermediatechords = \chordmode {
	\germanChords
	\set chordNameLowercaseMinor = ##t
	\set chordChanges = ##t
	\set noChordSymbol = ""
	fis1:7 | cis:7 | fis:9
}

\transpose c' g'% Version 1 (tief)
%\transpose c' a % Version 1,5
%\transpose c' c'% Version 2, vom fis startend
\transpose c' d'% Version 3, vom gis startend
	\new StaffGroup <<
		\new ChordNames \chordmode {  \intermediatechords }
		\new Staff {
			\chordmode { \intermediatechords }
			\makeClusters { <c b>2 <f b'>}
		}
	>>

\transpose c' f % a moll Version 1 (tief)
%\transpose c' g % h moll Version 1,5
%\transpose c' b% d moll Version 2, vom fis startend
%\transpose c' c'% Version 3, vom gis startend
\new StaffGroup <<
	\time 3/4
	\new ChordNames \chordsthree
	\new Staff {
		\tempo \markup {
			\concat {
				"Walzer ("
				\smaller \general-align #Y #DOWN \note #"2" #1
				" = "
				\smaller \general-align #Y #DOWN \note #"2." #1
				")"
			}
		}
		\melodythree
	}
	%\new Staff \with { instrumentName = "Klarinette" }
		%\transpose b c' {\clef violin \melodythree}

	%\new Staff \bassthree
>>

