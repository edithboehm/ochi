bassfour = \relative c {
		\key e \minor
		\clef bass
		\partial 2
		r2 h1 a g e
		fis d c2. e4 g2

		r2
		\repeat volta 2 {
			e' e fis c h g e e dis fis h a
		}
		\alternative{
			{g g gis d'}
			{g,1}
		}
		r2
		\bar "|."
	}

bassthree = \relative c {
		\key e \minor
		\clef bass
		\partial 2
		r2 h2. a g e
		fis d c4 e4 g c2.

		\repeat volta 2 {
			e4 e e fis fis fis g g g e e e
			dis dis dis a a dis
		}
		\alternative{
			{e e e gis gis d}
			{e2. r4}
		}
		\bar "|."
	}
