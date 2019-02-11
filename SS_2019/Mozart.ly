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
#(set-global-staff-size 17)

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

    % cl 1 page 1 line 1
    \barNumberCheck #1
    R1*8 |
    c''2\f c |
    c2. r8 \tuplet 3/2 { c16( h a } |
    g2) g |
    g2. r8 \tuplet 3/2 { g16( f e } |
    d4) d d d |
    d2 r2 |
    \mBreak
    
    % cl 1 page 1 line 2
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
    
    % cl 1 page 1 line 3
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
    
    % cl 1 page 1 line 4
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
    
    % cl 1 page 1 line 5
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
    % \barNumberCheck #110
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
    % \barNumberCheck #119
    \key es \major
    \time 3/8
    \tempo "Andante"
    R4.*7 |
    as8-.\f g-. r |
    as4.\p |
    f8 g\f\fermata r |
    r16 as16-.\p\noBeam g8( as) |
    g16( b, g' fis g8\noBeam) |
    r16( b, g' fis g8\noBeam) |
    r16( h, as' g as8\noBeam) |
    \mBreak
    
    % cl1 page 1 line 10
    % \barNumberCheck #133
    r16( h, as' g as8\noBeam) |
    r16( c, g' fis g8\noBeam) |
    r16( c, g' fis g8\noBeam) |
    r16( es\cresc c' h c8\noBeam) |
    r16( es, c' h c8\noBeam) |
    d,8\f d r |
    \mBreak
    
    % cl1 page 1 line 11
    % \barNumberCheck #139
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
    % \barNumberCheck #152
    \mBreak
    
    % cl1 page 2 line 2
    % \barNumberCheck #162
    \mBreak
    
    % cl1 page 2 line 3
    % \barNumberCheck #173
    \mBreak
    
    % cl1 page 2 line 4
    % \barNumberCheck #184
    \mBreak
    
    % cl1 page 2 line 5
    % \barNumberCheck #203
    \mBreak
    
    % cl1 page 2 line 6
    % \barNumberCheck #217
    \mBreak
    
    % cl1 page 2 line 7
    % \barNumberCheck #130
    \mBreak
    
    % cl1 page 2 line 8
    % \barNumberCheck #250
    \mBreak
    
    % cl1 page 2 line 9
    % \barNumberCheck #262
    \mBreak
    
    % cl1 page 2 line 10
    % \barNumberCheck #276
    \mBreak
    
    % cl1 page 2 line 11
    % \barNumberCheck #297
    \mBreak
    
    % cl1 page 2 line 12
    % \barNumberCheck #314
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

    % cl 2 page 1 line 1
    \barNumberCheck #1
    R1*8 |
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
