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
  title = "Die Entführung aus dem Serail"
  subtitle = "Ouvertüre"
  composer = "Wolfgang Amadeus Mozart (1756 - 1791)"
  tagline = ""
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 18)

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }
pesante = _\markup {\italic {"pesante"} }
pocoRit = ^\markup {\italic {"poco rit."} }
moltoRit = ^\markup {\italic {"molto rit."} }
pocoAnimato = ^\markup {\italic {"poco animato"} }
pocoAPocoPiuAnimato = ^\markup {\italic {"poco a poco più animato"} }
lunga = _\markup {\italic {"lunga"} }
string = ^\markup {\italic {"string."} }
legato = _\markup {\italic {"legato"} }
solo = ^\markup { "Solo" }
sic = ^\markup { \tiny { "sic!" } }

% Adapted from LSR http://lsr.di.unimi.it/LSR/Snippet?id=431
% Force a bar number to appear at the location of the next symbol
% Usage: \forceBarNumber a8 ...
forceBarNumber =
#(define-music-function (parser location music) (ly:music?)
    #{
      \override Score.BarNumber.break-visibility = ##(#f #t #t)
      $music
      \revert Score.BarNumber.break-visibility
    #})


% Adapted from http://lsr.di.unimi.it/LSR/Snippet?id=655
% Make title, subtitle, instrument appear on pages other than the first
#(define (part-not-first-page layout props arg)
   (if (not (= (chain-assoc-get 'page:page-number props -1)
               (ly:output-def-lookup layout 'first-page-number)))
       (interpret-markup layout props arg)
       empty-stencil))

\paper {
  oddHeaderMarkup = \markup
  \fill-line {
    " "
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:subtitle
      "     -     "
      \fromproperty #'header:instrument
    }
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:subtitle
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
}

% ---------------------------------------------------------

clarinet_I_in_C_Music = {
  \relative c' {
    \transposition c
    \key c \major
    \numericTimeSignature
    \time 2/2
    \tempo "Presto"

    % cl1 page 1 line 1
    \barNumberCheck #1
    R1*8 |
    c''2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d d d |
    d2 r2 |
    \mBreak
    
    % cl1 page 1 line 2
    \barNumberCheck #15
    c2\p c |
    e2.( f8 d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    e2 e |
    g2.( a8 f) |
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    \mBreak
    
    % cl1 page 1 line 3
    \barNumberCheck #25
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) r4 r2 |
    R1*5 |
    \mark #1
    c1\f |
    R1 |
    d1 |
    R1 |
    e1 |
    R1 |
    c1~ |
    c1~ |
    c2 c |
    \mBreak
    
    % cl1 page 1 line 4
    \barNumberCheck #42
    c2 r2 |
    R1*4 |
    d1\f~ |
    d1~ |
    d2 d |
    d2 r2 |
    R1*4 |
    d1\p~ |
    d1~ |
    d1~ |
    d1 |
    d2.\f cis4 |
    d2. cis4 |
    d2. cis4 |
    \mBreak
    
    % cl1 page 1 line 5
    \barNumberCheck #62
    d4 cis d cis |
    d2 d |
    d2 r2 |
    \mark #2
    R1*12
    a'1\f~ |
    a1~ |
    a1~ |
    a1 |
    g4 r4 r2 |
    R1*3 |
    r2 e2\p( |
    d1)~ |
    d2 e( |
    \mBreak
    
    % cl1 page 1 line 6
    \barNumberCheck #88
    d1)~ |
    d4 d-.\f d8( c h c |
    d4) d-. d8( e d cis |
    d4) d-. d8( c h c |
    d4) d-. d8( e d cis) |
    \mark #3
    d1 |
    h1 |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    \mBreak
    
    % cl1 page 1 line 7
    \barNumberCheck #96
    a1 |
    d1\p( |
    c1 |
    b1 |
    a1) |
    d1\f |
    h?1 |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    a1 |
    d1\p( |
    c1 |
    b1 |
    a1) |
    h?1\f |
    \mBreak
    
    % cl1 page 1 line 8
    \barNumberCheck #110
    c2 c4 c |
    h1 |
    c2 c4 c |
    h2. c4 |
    d2. c4 |
    h4 c d c |
    h4 c d c |
    h2 h |
    h2 r2\fermata
    \bar "||"
    \mBreak

    % cl1 page 1 line 9
    \barNumberCheck #119
    \key es \major
    \time 3/8
    \tempo "Andante"
    R4.*7 |
    as8-.\f g-. r |
    as4.\p |
    f8 g\f\fermata r |
    r16. as32-.\p\noBeam g8( as) |
    g16( b, g' fis g8\noBeam) |
    r16 b,( g' fis g8\noBeam) |
    r16 h,( as' g as8\noBeam) |
    \mBreak
    
    % cl1 page 1 line 10
    \barNumberCheck #133
    r16 h,( as' g as8\noBeam) |
    r16 c,( g' fis g8\noBeam) |
    r16 c,( g' fis g8\noBeam) |
    r16 es(\cresc c' h c8\noBeam) |
    r16 es,( c' h c8\noBeam) |
    d,8\f d r |
    \mBreak
    
    % cl1 page 1 line 11
    \barNumberCheck #139
    R4.*3 |
    f4.\p |
    d8 g8\f\fermata r |
    R4. |
    c16(\p d es e f fis) |
    g4.~ |
    g4.~ |
    g4.~ |
    g4. |
    f,4. |
    d8 g8\f\fermata r |
    \mBreak
  
    % cl1 page 2 line 1
    \barNumberCheck #152
    r16. a32-.\p\noBeam g8( f) |
    \bar "||"
    \key c \major
    \time 2/2
    \tempo "Tempo primo"
    e?2\p c'2 |
    e2.( f8 d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    e2 e |
    g2.( a8 f) |
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2\f c |
    \mBreak
    
    % cl1 page 2 line 2
    \barNumberCheck #162
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d-. d-. d-. |
    d2 r2 |
    c2\p c |
    e2. f8( d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    e2 e |
    g2.( a8 f) |
    \mBreak
    
    % cl1 page 2 line 3
    \barNumberCheck #173
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d-.\p d-. d-. |
    d2 r2 |
    r4 c-. c-. c-. |
    c2 r2 |
    r4 d-. d-. d-. ||
    \mBreak
    
    % cl1 page 2 line 4
    \barNumberCheck #184
    d2 r2 |
    \mark #4
    c1\f
    R1 |
    d1 |
    R1 |
    e1 |
    R1 |
    c1~ |
    c1~ |
    c2 c |
    c2 r2 |
    R1*4 |
    d1\f~ |
    d1~ |
    d2 d |
    d1~ |
    \mBreak
    
    % cl1 page 2 line 5
    \barNumberCheck #203
    d4\p c8 b a4 a |
    b4 a8 g fis4 fis |
    a8( g fis g) b( a g a) |
    b1 |
    b1\f~ |
    b1~ |
    b2 b |
    b2 r |
    R1*4 |
    as1\f~ |
    as1~ |
    \mBreak
    
    % cl1 page 2 line 6
    \barNumberCheck #217
    as2 as |
    as2 c~ |
    c4\p b8 as g4 g |
    as4 g8 f e4 e |
    g8( f e f) as( g f g) |
    as1 |
    c1\f |
    h?1 |
    c1 |
    d1 |
    R1*3 |
    \mBreak
    
    % cl1 page 2 line 7
    \barNumberCheck #230
    g2.\f fis4 |
    g2.\fz fis4 |
    g2.\fz fis4 |
    g4 fis g fis |
    g2 g |
    g2 r |
    \mark #5
    R1*8 |
    g2\f g |
    g2. r4 |
    g2 g |
    g2. r4 |
    f2 f |
    f2. r8 f32( e d c |
    \mBreak
    
    % cl1 page 2 line 8
    \barNumberCheck #250
    h2) h |
    h2. r8 h32( a g f |
    e4) r a2\p( |
    g2 f |
    e2) a( |
    g2 f |
    e2) g~ |
    g1~ |
    g2 g~ |
    g1~ |
    g4 r g'8\f( f e f) |
    g2 g8( a g fis) |
    \mBreak
    
    % cl1 page 2 line 9
    \barNumberCheck #262
    g2 g8( f e f) |
    g2 g8( a g fis) |
    \mark #6
    g1\fz |
    e1\fz |
    \acciaccatura { g16 } f4 f f f |
    d1\fz |
    R1*4 |
    g1\fz |
    e1\fz |
    \acciaccatura { g16 } f4 f f f |
    d2\fz r |
    \mBreak
    
    % cl1 page 2 line 10
    \barNumberCheck #276
    es1\p( |
    d1 |
    c1 |
    h1) |
    R1*4 |
    e1\cresc( |
    d1 |
    c1 |
    h1) |
    \mark #7
    c1\fp |
    R1 |
    f1\fp |
    R1 |
    g1 |
    R1 |
    a1\fz |
    a1\fz |
    a1\fz~ |
    \mBreak
    
    % cl1 page 2 line 11
    \barNumberCheck #297
    a2 a\fz |
    g2 e |
    f2 d |
    a'1\fz |
    a1\fz |
    a1\fz~ |
    a2 a\fz |
    g1( |
    e1 |
    f1 |
    d1) |
    c1\ff~ |
    c1 |
    e1\ff~ |
    e1 |
    g1\ff~ |
    g1 |
    \mBreak
    
    % cl1 page 2 line 12
    \barNumberCheck #314
    c4\ff e,8. e16 e4 g |
    e4 g e g |
    e4 e8. e16 e4 g |
    e4 g e g |
    e4 e8. e16 e4 g |
    e4 g e g |
    e2. r4 |
    c'2. r4 |
    c,1\fermata
    \bar "|."
    \mBreak
    
  }
}


clarinet_II_in_C_Music = {
  \relative c' {
    \transposition c
    \key c \major
    \numericTimeSignature
    \time 2/2
    \tempo "Presto"

    % cl2 page 1 line 1
    \barNumberCheck #1
    R1*8 |
    c''2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) h h h |
    h2 r2 |
    \mBreak
    
    % cl2 page 1 line 2
    \barNumberCheck #15
    e,2\p e |
    g2.( a8 f) |
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2 c |
    e2.( f8 d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    c'2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    \mBreak
    
    % cl2 page 1 line 3
    \barNumberCheck #25
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) r4 r2 |
    R1*5 |
    \mark #1
    c1\f |
    R1 |
    d1 |
    R1 |
    e1 |
    R1 |
    a,1~ |
    a1~ |
    a2 a |
    \mBreak
    
    % cl2 page 1 line 4
    \barNumberCheck #42
    a2 r2 |
    R1*4 |
    b1\f~ |
    b1~ |
    b2 b |
    b2 r2 |
    R1*4 |
    d1\p~ |
    d1~ |
    d1~ |
    d1 |
    r4 fis,\f g2 |
    r4 fis g2 |
    r4 fis g2 |
    \mBreak
    
    % cl2 page 1 line 5
    \barNumberCheck #62
    fis4 g fis g |
    fis2 fis |
    fis2 r2 |
    \mark #2
    R1*12
    c'1\f~ |
    c1~ |
    c1~ |
    c1 |
    h4 r4 r2 |
    R1*3 |
    r2 c2\p( |
    h2 c |
    h2) c( |
    \mBreak
    
    % cl2 page 1 line 6
    \barNumberCheck #88
    h2 c |
    h4) d-.\f d8( c h c |
    d4) d-. d8( e d cis |
    d4) d-. d8( c h c |
    d4) d-. d8( e d cis) |
    \mark #3
    d1 |
    g,1 |
    \acciaccatura { h16 } a4-. a-. a-. a-. |
    \mBreak
    
    % cl2 page 1 line 7
    \barNumberCheck #96
    fis1 |
    b1\p( |
    a1 |
    g1 |
    fis1) |
    h?1\f |
    g1 |
    \acciaccatura { h16 } a4-. a-. a-. a-. |
    fis1 |
    b1\p( |
    a1 |
    g1 |
    fis1) |
    g1\f |
    \mBreak
    
    % cl2 page 1 line 8
    \barNumberCheck #110
    a2 a4 a |
    g1 |
    a2 a4 a |
    g2. a4 |
    g2. a4 |
    g4 a g a |
    g4 a g a |
    g2 g |
    g2 r2\fermata
    \bar "||"
    \mBreak

    % cl2 page 1 line 9
    \barNumberCheck #119
    \key es \major
    \time 3/8
    \tempo "Andante"
    R4.*7 |
    es8-.\f es-. r |
    f4.\p |
    d8 es\f\fermata r |
    r16. f32-.\p\noBeam b8 b |
    b16( b, es d es8\noBeam) |
    r16 b( es d es8\noBeam) |
    r16 h( f' e f8\noBeam) |
    \mBreak
    
    % cl2 page 1 line 10
    \barNumberCheck #133
    r16 h,( f' e f8\noBeam) |
    r16 c( es d es8\noBeam) |
    r16 c( es d es8\noBeam) |
    r16 c(\cresc es d es8\noBeam) |
    r16 c( es d es8\noBeam) |
    h8\f h r |
    R4.*3 |
    \mBreak
    
    % cl2 page 1 line 11
    \barNumberCheck #142
    d4.\p |
    h8 es8\f\fermata r |
    r16. as32-.\p\noBeam g8 g |	% FIXME: Similar rhythm in various places above
    g4 r8 |
    R4. |
    es8-. d-. r |
    R4. |
    es8-. d-. r |
    d4. |
    h8 es8\f\fermata r |
    \mBreak
  
    % cl2 page 2 line 1
    \barNumberCheck #152
    r16. f32-.\p\noBeam es8( d) |
    \bar "||"
    \key c \major
    \time 2/2
    \tempo "Tempo primo"
    e?2\p c'2 |
    e2.( f8 d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    e2 e |
    g2.( a8 f) |
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2\f c |
    \mBreak
    
    % cl2 page 2 line 2
    \barNumberCheck #162
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d-. d-. d-. |
    d2 r2 |
    c2\p c |
    e2. f8( d) |
    \acciaccatura { d16 } c4-. c-. c-. c-. |
    c2 r2 |
    e2 e |
    g2.( a8 f) |
    \mBreak
    
    % cl2 page 2 line 3
    \barNumberCheck #173
    \acciaccatura { f16 } e4-. e-. e-. e-. |
    e2 r2 |
    c'2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d-.\p d-. d-. |
    d2 r2 |
    r4 c-. c-. c-. |
    c2 r2 |
    r4 d-. d-. d-. ||
    \mBreak
    
    % cl2 page 2 line 4
    \barNumberCheck #184
    d2 r2 |
    \mark #4
    c1\f
    R1 |
    d1 |
    R1 |
    e1 |
    R1 |
    c1~ |
    c1~ |
    c2 c |
    c2 r2 |
    R1*4 |
    d1\f~ |
    d1~ |
    d2 d |
    d1~ |
    \mBreak
    
    % cl2 page 2 line 5
    \barNumberCheck #203
    d4\p c8 b a4 a |
    b4 a8 g fis4 fis |
    a8( g fis g) b( a g a) |
    b1 |
    b1\f~ |
    b1~ |
    b2 b |
    b2 r |
    R1*4 |
    as1\f~ |
    as1~ |
    \mBreak
    
    % cl2 page 2 line 6
    \barNumberCheck #217
    as2 as |
    as2 c~ |
    c4\p b8 as g4 g |
    as4 g8 f e4 e |
    g8( f e f) as( g f g) |
    as1 |
    c1\f |
    h?1 |
    c1 |
    d1 |
    R1*3 |
    \mBreak
    
    % cl2 page 2 line 7
    \barNumberCheck #230
    g2.\f fis4 |
    g2.\fz fis4 |
    g2.\fz fis4 |
    g4 fis g fis |
    g2 g |
    g2 r |
    \mark #5
    R1*8 |
    g2\f g |
    g2. r4 |
    g2 g |
    g2. r4 |
    f2 f |
    f2. r8 f32( e d c |
    \mBreak
    
    % cl2 page 2 line 8
    \barNumberCheck #250
    h2) h |
    h2. r8 h32( a g f |
    e4) r a2\p( |
    g2 f |
    e2) a( |
    g2 f |
    e2) g~ |
    g1~ |
    g2 g~ |
    g1~ |
    g4 r g'8\f( f e f) |
    g2 g8( a g fis) |
    \mBreak
    
    % cl2 page 2 line 9
    \barNumberCheck #262
    g2 g8( f e f) |
    g2 g8( a g fis) |
    \mark #6
    g1\fz |
    e1\fz |
    \acciaccatura { g16 } f4 f f f |
    d1\fz |
    R1*4 |
    g1\fz |
    e1\fz |
    \acciaccatura { g16 } f4 f f f |
    d2\fz r |
    \mBreak
    
    % cl2 page 2 line 10
    \barNumberCheck #276
    es1\p( |
    d1 |
    c1 |
    h1) |
    R1*4 |
    e1\cresc( |
    d1 |
    c1 |
    h1) |
    \mark #7
    c1\fp |
    R1 |
    f1\fp |
    R1 |
    g1 |
    R1 |
    a1\fz |
    a1\fz |
    a1\fz~ |
    \mBreak
    
    % cl2 page 2 line 11
    \barNumberCheck #297
    a2 a\fz |
    g2 e |
    f2 d |
    a'1\fz |
    a1\fz |
    a1\fz~ |
    a2 a\fz |
    g1( |
    e1 |
    f1 |
    d1) |
    c1\ff~ |
    c1 |
    e1\ff~ |
    e1 |
    g1\ff~ |
    g1 |
    \mBreak
    
    % cl2 page 2 line 12
    \barNumberCheck #314
    c4\ff e,8. e16 e4 g |
    e4 g e g |
    e4 e8. e16 e4 g |
    e4 g e g |
    e4 e8. e16 e4 g |
    e4 g e g |
    e2. r4 |
    c'2. r4 |
    c,1\fermata
    \bar "|."
    \mBreak
    
  }
}


\bookpart {
  \header{
    instrument = "Klarinette I in C"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose c b
          \clarinet_I_in_C_Music
        }
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in C"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          % \transpose c b
          \clarinet_II_in_C_Music
        }
      }
    }
  }
}
