%{
%}

\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}
  
\header{
  title = "Stenka Rasin"
  subtitle = "Sinfonische Dichtung op.13"
  composer = "Alexandre Glasunow (1865 - 1936)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = { \break }

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }


clarinet_I_in_A_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % line 1
  }
}

clarinet_II_in_A_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % line 1
  }
}

\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      % Make grace notes smaller and more fragile
      $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
      $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
      $(add-grace-property 'Voice 'Flag 'font-size '-5)
      $(add-grace-property 'Voice 'Stem 'length '8)
      $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
      $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
      $(add-grace-property 'Voice 'Beam 'shorten '1)
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose b a
          \clarinet_I_in_A_Music
        }
      }
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      % Make grace notes smaller and more fragile
      $(add-grace-property 'Voice 'NoteHead 'font-size '-5)
      $(add-grace-property 'Voice 'Slur 'height-limit '0.5)
      $(add-grace-property 'Voice 'Flag 'font-size '-5)
      $(add-grace-property 'Voice 'Stem 'length '8)
      $(add-grace-property 'Voice 'Beam 'beam-thickness '0.3)
      $(add-grace-property 'Voice 'Beam 'length-fraction '0.5)
      $(add-grace-property 'Voice 'Beam 'shorten '1)
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose b a
          \clarinet_II_in_A_Music
        }
      }
    }
  }
}
