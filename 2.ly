\include "header.ly"

twofour =
	\relative c'' {
		#(set-accidental-style 'modern-cautionary)
		\key e \minor
		\partial 2
		r2 R1*8
		\repeat volta 2{
			c8 h a h c h a h c h a h c h a c
			<h-3>  a g a h a g a h a g a h a g h
			<a-3> g fis g
			a g fis a
			h, cis dis e
			fis g a fis
		}
		\alternative{
			{%
				g fis e g
				a g fis <a-2>
				h a g a
				h g a <h-2>
			}
			{
				e, e' h g
				e g fis dis
				e2
			}
		}
	}
