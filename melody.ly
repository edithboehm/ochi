\include "header.ly"

melodyfour =
	\relative c'' {
		#(set-accidental-style 'modern-cautionary)
			\key e \minor
			\partial 2
			ais4 h c2 h
			r2 ais4 h c2 h
			r2 h4 e e2 dis
			r2 fis4 g fis2 e
			r2
			g4 a4

			\repeat volta 2{
				 g fis c2
				r2 fis4 g fis e h2

				r2 ais4 h c2 h r fis'4 g
			}
			\alternative{
				{fis2 e r2 g4 a }
				{e1}
			}
			r2
			\bar "|."
		}

melodythree = \relative c'' {
			\key e \minor
			\clef violin
			\partial 2
			ais4 h c2 h4
			r4 ais4 h c2 h4
			r4 h4 e e2 dis4
			r4 fis4 g fis2 e4

			r g a
			\repeat volta 2 {
				g fis c
				r4 fis4 g fis e h

				r4 ais4 h c2 h4 r4 fis' g
			}
			\alternative{
				{fis2 e4 r g a}
				{e2. r4}
			}
			\bar "|."
		}
