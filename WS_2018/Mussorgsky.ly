%{
%}

\version "2.18.2"
\language "deutsch"

% %{
\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}
% %}
  
\header{
  title = "Khovantchina Overture"
  subtitle = ""
  composer = "Modest Mussorgsky (1839 - 1881)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = { \break }

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }


clarinet_I_in_A_Music = {
  \relative c' {
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
    \bar "||" \key f \major
    \mark #2
    c1\p |
    d |
    f |
    d2( a) |
    \mBreak
    
% line 4
    h2 c4~c8 r8 |
    c2( d) |
    f1 |
    f4.( g8) d4.( c8) |
    h2 c4( g) |
    e( fis) d2 |
    h2~ h8 r8 r4 \bar "||"
    \mark #3
    \tempo "Piu mosso" 4 = 100
    R1*2
    e2(\f g4 e4) |
    \mBreak
    
% line 5 (start)
    a( h c h8 a) |
    g2( e2) |
    f4( e d a) |
    c( h c h) |
    a2( h4 a) |
    g2( e4) r4 \bar "||"
    \mark #4
  }
}


clarinet_I_in_B_Music = {
  \relative c' {
    \key as \major
    \numericTimeSignature
    \time 2/2
    \tempo "Moderato. Alla breve" 2 = 66
    
% line 5 (continued)
    c'2(_\pDolce es4 c |
    f g as g8 f) |
    \mBreak
    
% line 6
    es2( d) |
    des4( c b f |
    as g as g) |
    f2( g4 f) |
    es2~ es8 r8 r4 |
    c'2( es4 c |
    f as g8 as16 g f4) |
    es2( c) |
    f4( es8 des c4 b |
    \mBreak
    
% line 7
    c b as g) |
    f( as g f) |
    es~ es8 r8 r2 |
    \mark #5
    \key es \major
    g2\p^\markup {Solo }( b4 g |
    c2 es) |
    d4( es8 d c4 g |
    h2.->) r4 |
    R1*2 |
    h2.-> r4 |
    R1 |
    \mBreak
    
    
% line 8
    h2.-> r4 |
    R1*7 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-2
        R1 |
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Fl.I"
        \stemUp {
          h2^( d4 h |
          f'1)^( |
          b2.) f4\rest |
        }
      }
    >>
    R1 |
    g,2\p( b4 g) |
    c2( es) |
    \mBreak

% line 9
    des4( es8 d c4 g |
    b2.)\> r4\! |
    R1*1 |
    f2( as) |
    g4( as8 g f4 c) |
    es2.\> r4\! |
    R1*8 |
    R1\fermataMarkup
    \bar "|." |
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
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \new Voice {
        {
          % \transpose b a
          \clarinet_I_in_A_Music
        }
        \clarinet_I_in_B_Music
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
