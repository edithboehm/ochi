
chordsfour = \chordmode {
		\germanChords
		\set chordNameLowercaseMinor = ##t
		\set chordChanges = ##t
		\set noChordSymbol = ""

		\partial 2
		r2 h1 h:7 e:m e:m h h:7 c c

		\repeat volta 2{
			a1:m a:6m e:m e:m h h:7
		}
		\alternative{
			{e1:m e:7}
			{e1:m}
		}
		r2
		\bar "|."
	}
chordsthree = \chordmode {
		\partial 2
		\germanChords
		\set chordNameLowercaseMinor = ##t
		\set chordChanges = ##t
		\set noChordSymbol = ""

		r2 h2. h:7 e:m e:m h h:7 c c

		\repeat volta 2{
			a2.:m a:6m e:m e:m h h:7
		}
		\alternative{
			{e2.:m e:7}
			{e:m r4}
		}
		\bar "|."

	}
