%{
%}

\version "2.18.2"
\language "deutsch"

%{
\paper {
    top-margin = 20\mm
    bottom-margin = 20\mm
    left-margin = 20\mm
    right-margin = 20\mm
    ragged-last = #f
}
%}
  
\header{
  title = "Khovantchina Overture"
  subtitle = ""
  composer = "Modest Mussorgsky (1839 - 1881)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = { \break } 

clarinetIMusic = {
  \relative c' {
    \set Score.markFormatter = #format-mark-box-alphabet
    \override DynamicLineSpanner.staff-padding = #3
    \transposition a
    \key g \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante tranquillo" 8 = 72

% line 1
    R1*4
    <<
      {
       \override MultiMeasureRest.staff-position = #-2
        R1 |
        R1 |
        R1 |
        e2\rest e4\rest e8.\rest c''32\f^\markup { Solo } c |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Ob.I, Viol.II"
        \stemUp {
          g2^\( h4 d8 h |
          e2 d4 h\) |
          c8^\( h a e g4 fis4 |
          g8 fis e4\) d4~ d8 fis8\rest
        }
      }
    >>
    c'4->~\sf \tuplet 3/2 { c16 h c } \tuplet 3/2 { a c g } \tuplet 3/2 { c fis, e' } d8->~ d r8 |
    R1 |
    \tuplet 3/2 { fis,8-.\mf fis-. fis-. } e4-> \tuplet 3/2 { fis8-. fis-. fis-. } e4-> |
    \mBreak
    
% line 2
    \mark #1
    fis2~\p\> fis8\! r8 r4 |
    r2 g,,\pp^\markup { Solo }~ |
    g16( h e d h d g h) e( d h g fis g h d |
    g8) r8 r4 r2 |
    h4\p( g8 e) a\( c h \grace { c16 h } a8 \) |
    g4( e8) r8 a8( g16 f e8 d)
    \mBreak
    
% line 3
    e(d c h) a( c h a) |
    g4( f8 g16 f) e4~\> e8\! r8 |
    R1
    e'2\p\>~ e8\! r8 r4 |
    R1
    h2.\pp~ h8 r8 |
    b2.\p~ b8 r8 |
    \bar "||" \key f \major \mark #2
    c1\p |
    d |
    f |
    d2( a) |
    \mBreak
    
% line 4
    h2 c4~c8 r8 |
    
  }
}

clarinetIIMusic = {
  \relative c' {
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
      \new Voice {
        % \transpose b a
        \clarinetIMusic
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
      \new Voice {
        \clarinetIIMusic
      }
    }
  }
}
