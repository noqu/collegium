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
#(set-global-staff-size 13)

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }
pesante = _\markup {\italic {"pesante"} }
pocoRit = _\markup {\italic {"poco rit."} }


clarinet_I_in_A_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % page 1 line 1
    R1*13 |
    d1->\f\>~ |
    d~ |
    d~ |
    d2\! r2 |
    d1\p~ |
    d |
    d1~ |
    d1~\> |
    \mark #1
    d4\! r4 r2 |
    R1*12 |
    b1->\mf\>~ |
    b~ |
    b2\pp r2 |
    r1 |
    \mBreak
    
    % page 1 line 2
    \mark "Solo"
    g''4.\p g8 g( f e d) |
    c4( g') e2 |
    g4. g8 g( f e d) |
    c4( g') e2\>~ |
    \mark #2
    e4\pp r4 r2 |
    R1*2 |
    es2\mf( d |
    cis1) |
    R1*2 |
    c'4\f( es d c) |
    g( b a g) |
    \mBreak
    
    % page 1 line 3
    r4 h~\f \tuplet 3/2 { h8 h\> h } \tuplet 3/2 { h8 h\! h }  |
    b2 b2 \> |
    R1\! |
    g1->\f\> |
    \bar "||" \time 3/4 \tempo "Allegro con brio" 4 = 120
    f8\p\! r8 r4 r4 |
    R2. |
    r8 a,16\f( h) c d c h a h a g |
    a8-. a16( h) c d c h a h a g |
    \mBreak
    
    % page 1 line 4
    a8-. r r a16( h) c d c h |
    a h a c h\< c h c h c h c |
    d8-.\sf a16( h) c d c h a h a g |
    a8 a16( h) c d c h a h a g |
    \mBreak
    
    % page 1 line 5
    a8 r r a16( h) c d c h |
    a h a c h\< c h c h c h c |
    c8\sf c, b4 b8( a) |
    b b b4 b8( a) |
    b b b( a) b16( a g8) |
    \mBreak

    % page 1 line 6
    b b b4 c8( e) |
    R2.*4 |
    \mark #3
    c'8\f r b,16 c d es f g a b |
    a( b) c8~ c b16 a g( f) d8 |
    r4 c'' d |
    d\< d2\! |
    d4\< d2\! |
    c8 c,-. b c d( c16 b) |
    \mBreak
    
    % page 1 line 7
    a8-. a-. g a b( a16 g) |
    f8 r r4 r |
    r r b'16(\< c b c)\! |
    d8 r8 r4 r |
    r r d\< |
    d8\sf r8 r4 r |
    r r a16(\< h a g)\! |
    a8 r8 r4 r |
    \mBreak
    
    % page 1 line 8
    r4 r h16(\< a h c) |
    d2.\ff\>~ |
    d8\! r8 r4 r |
    d,2.\f\>~ |
    d8\! r8 r4 r |
    R2.*3 |
    h'8.\mf\< h16 h8-. h-. h-. h-. |
    \mark #4
    d\f r16 a\ff g8\pesante a \acciaccatura { c8 } h( a16 g) |
    a8 g16( d f8) r8 r4 |
    \mBreak
    
    % page 1 line 9
    R2. |
    r8 \mark Solo d16\p\<( d f g f e d e d c\! ) |
    b16( a g8) r4 r |
    r8 g'16(\< a b c b a g a g ges\! |
    f8) r8 r4 g\mf |
    f8 r8 r4 g |
    \mBreak
    
    % page 1 line 10
    fis8 r8 r4 c'8(\> a)\! |
    d8 r8 r4 c8(\> a)\! |
    d8 r8 r4 r |
    r4 as8\f\< r as\! r |
    b8\sf b16\mf b b8 b16 b b8 b16 b |
    b8 b16 b b8 b16 b b8\< b16 b |
    \mBreak
    
    % page 1 line 11
    b8 b16 b b8 b16 b b8 b16 b\! |
    b8 b16 b b8 b16 b b8 b16 b |
    g8 r8 r4 r |
    R2.*5 |
    cis8\mf cis16 cis cis8\< cis16 cis cis8 cis16 cis |
    \mark #5
    c8\sf r8 r4 r4 |
    R2.*3 |
    R2.*4\pocoRit |
    \mBreak
  }
}

clarinet_I_in_B_Music = {
  \relative c' {

    % page 2 line 1
    \mark Solo
    g''2.\p~ |
    g2.~ |
    \bar "||"
    \tempo "Allegro moderato" 4 = 100
    \key c \major
    g2.~ |
    g2.\> |
    g4\! e8( f g4~ |
    g8) g( f e d c) |
    e4 c8( d e4~ |
    e8) e( d c h a) |
    c4 a8( h c4~ |
    c8) d( c h a g) |
    a4 e8( g a4~ |
    \mBreak
    
    % page 2 line 2
    a8) h( c d e a) |
    g4\mf e8( f g4~ |
    g8) g( f e d c) |
    e4 c8( d e4~ |
    e8) e( d c h a) |
    c4 as8( b c4~ |
    c8) c( b as g f) |
    as4 f8( g a4~\> |
    a4) g2(\! |
    \mBreak
    
    % page 2 line 3
    \mark #6
    c8) r8 r4 r |
    
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
