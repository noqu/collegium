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
  title = "Konzertsatz f-moll"
  composer = "Clara Schumann (1819 - 1896)"
  tagline = ""
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }
pesante = _\markup {\italic {"pesante"} }
rit = ^\markup {\italic {"rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
moltoRit = ^\markup {\italic {"molto rit."} }
tranquillo = ^\markup {\italic {"tranquillo"} }
moltoTranquillo = ^\markup {\italic {"molto tranquillo"} }
pocoAnimato = ^\markup {\italic {"poco animato"} }
pocoAPocoPiuAnimato = ^\markup {\italic {"poco a poco più animato"} }
pocoAPocoStringendo = ^\markup {\italic {"poco a poco stringendo"} }
lunga = _\markup {\italic {"lunga"} }
string = ^\markup {\italic {"string."} }
legato = _\markup {\italic {"legato"} }
moltoEspressivo = _\markup {\italic {"molto espressivo"} }
espressivo = _\markup {\italic {"espressivo"} }
solo = ^\markup { "Solo" }
sic = ^\markup { \tiny { "sic!" } }
accel = ^\markup { \bold { "accel." } }
aTempo = ^\markup { \bold { "a tempo" } }
dieselben = ^\markup { \bold { "Dieselben ganzen Takte" } }
oboeI = ^\markup { "Ob.I" }

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

clarinet_I_main = {
  \relative c' {
    \transposition b
    \key b \major
    \defaultTimeSignature
    \time 3/4
    \tempo "Moderato" 4 = 112

    % cl1 page 1 line 1
    \barNumberCheck #1
    r4 r g' |
    c2\< c4 |
    c2 c4\! |
    c8[ r16 a] a4.. a16\f |
    b8. fis16 g8. d16 es8. d16 |
    \mBreak
    
    % cl1 page 1 line 2
    \barNumberCheck #6
    c8. d16 es4. b8 |
    a4 r4 r4 |
    R2. |
    r4 r8 es''(\p\solo c a |
    g4 fis4) r |
    R2. |
    \mBreak
    
    % cl1 page 1 line 3
    \barNumberCheck #12
    r4 r r8 es\f |
    e8[ r16 d] cis4 r |
    R2.*13 |
    \barNumberCheck #27
    \mark #2
    R2.*16 |
    \barNumberCheck #43
    \mark #3
    R2.*2 |
    \barNumberCheck #45
    r4 r dis'\f\> |
    d4 d c |
    h4 c\!\p r |
    \mBreak
    
    % cl1 page 1 line 4
    \barNumberCheck #48
    R2.*9 |
    \mark #4
    r4 r8 d\f( b g |
    b4 a8) g'( es h |
    d8 c) r4 r |
    R2.*13 |
    \barNumberCheck #73
    \mark #5
    R2.*11 |
    \mBreak
    
    % cl1 page 1 line 5
    \barNumberCheck #84
    <<
      {
        R2.*2 |
        g2(\mf\solo c4 |
        cis4 d as |
        g2) r4 |
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.II"
        \stemDown\slurDown {
          e2\pp( des4~ |
          des4 fis f |
          es4) 
        }
      }
    >>
    R2.*8\moltoTranquillo |
    \mBreak
    
    % cl1 page 1 line 6
    \barNumberCheck #97
    \mark #6
    r8 b'4(\p b8\< c des |
    des4\> c b |
    b2.~ |
    b2\aTempo a4 |
    f8)\pp r8 r4 r |
    R2.*8 |
    \mBreak
    
    % cl1 page 2 line 1
    \barNumberCheck #110
    <<
      {
        b4.\< b8( des\> a) |
        b2 b4\< |
        cis'4. cis8(\> ais e) |
        d4\! r r |
        h4.\< h8( d ais\!) |
      }
      \new Staff \with {
        \remove "Time_signature_engraver"
        % Available with v2.20
        % \remove "Time_signature_engraver"
        % \magnifyStaff #2/3
        % firstClef = ##f
        % alignAboveContext = #"main"
        % In v2.18, we can workaround it like this:
        fontSize = -4
        \override StaffSymbol.staff-space = #(magstep -4)
        \override StaffSymbol.thickness = #(magstep -4)
        instrumentName = #"Ob.I"
      } {
        \key as \major
        es'2(\oboeI g,4) |
        a2 r4 |
        R2.*2
        e2( gis4) |
      }
    >>
    \mBreak
    
    % cl1 page 2 line 2
    \barNumberCheck #115
    h2 h4\< | % Why on earth do we need two ' here ?
    d'4.\! h8\>(\pocoAPocoStringendo f d) |
    \mark #7
    f2\! r4 |
    R2.*3 |
    r4 r b,\f~ |
    b4 a2~ |
    \mBreak
  
    % cl1 page 2 line 3
    \barNumberCheck #123
    a4 r r |
    R2.*19 |
    \mark #8
    R2.*2 |
    r4 a\p( b) |
    r4 a( b) |
    R2.*4\string
    \mBreak
    
    % cl1 page 2 line 4
    \barNumberCheck #151
    r4 es\mf d~ |
    d4 cis es-- |
    \mark #9
    f8\sf r8 r4 r |
    R2.*5 |
    r4 b,\mp\<( a~ |
    \mBreak
    
    % cl1 page 2 line 5
    \barNumberCheck #160
    a4 g2)~ |
    g4\f r r |
    R2.*5 |
    \mark #10
    r4 r g4\p(
    c2\< c4 |
    c2 c4 \! |
    \mBreak
    
    % cl1 page 2 line 6
    \barNumberCheck #170
    c8)[ r16 a] a4..\cresc a16\f |
    b8. fis16 g8. d16 es8. d16 |
    c8. d16 es4. b8 |
    a4 r r |
    R2. |
    \mBreak
    
    % cl1 page 2 line 7
    \barNumberCheck 175
    r4 r8 es''( c as |
    g4 as8 ) es'([ c as] |
    h4 c8) g'([ es c] |
    cis4 d8) r8 r4 |
    R2.*9\pocoRit |
    \bar "||"
    \mBreak
    
    % cl1 page 2 line 8
    \barNumberCheck #188
    \mark #11
    R2.\aTempo |
    c2\p c4 |
    c2 r4 |
    R2.*2 |
    f2\p g4 |
    g2 r4 |
    R2.*5 |
    \mBreak
    
    % cl1 page 3 line 1
    \barNumberCheck #200
    \mark #12
    R2. |
    d2\mf d4 |
    d2 r4 |
    R2.*4 |
    r4 r g,\f |
    fis4 r r |
    r4 r as\< |
    \mBreak
    
    % cl1 page 3 line 2
    \barNumberCheck #210
    g4\! r r |
    \mark #13
    R2.*2 |
    r4 r8 fis\f( d h |
    h'2 gis4 |
    a4) r r |
    R2. |
    \mBreak
    
    % cl1 page 3 line 3
    \barNumberCheck #217
    g'2\mf( cis,4 |
    d2) r4\rit |
    R2.*2 |
    \mark #14
    R2.*15\tranquillo |
    r4 r\moltoEspressivo a4( |
    es'2 des8 c |
    \mBreak
    
    % cl1 page 3 line 4
    \barNumberCheck238
    f2 b,4 |
    des4. b8 as g |
    es'2 c4 |
    as2 ges4 |
    f2) f4\p\cresc(~ |
    f2 g4 |
    as2 a4 |
    \mBreak
    
    % cl1 page 3 line 5
    \barNumberCheck #245
    \mark#15
    b4)\f r r |
    R2.*9 |
    \bar "||"
    \mark #16
    r4 r g\f( |
    c2\cresc c4 |
    c2 c4 |
    c8)[ r16 a16] a4.. a16\ff |
    \mBreak
    
    % cl1 page 3 line 6
    \barNumberCheck #259
    b8. fis16 g8. d16 es8. d16 |
    c8. d16 es4. b8 |
    a4 r r |
    R2.*3 |
    r4 r r8 es'8\f |
    \mBreak
    
    % cl1 page 3 line 7
    \barNumberCheck #266
    e8[ r16 d16] cis4 r4 |
    R2.*5 |
    \mark #17
    \barNumberCheck 272
    R2.*9 |
    r4 \tuplet 3/2 { r8\p es'->\espressivo( d-> } \tuplet 3/2 { c8-> b-> a-> } |
    g4 fis4. fis8 |
    fis8 g) r4 r |
    \mBreak
    
    % cl1 page 3 line 8
    \barNumberCheck #284
    \mark #18
    R2.*2 |
    cis2\f\> dis4 |
    d4 d c |
    h4 c\! r |
    R2.*2 |
    \mBreak
    
    % cl1 page 3 line 9
    \barNumberCheck #291
    d,4\p( f es |
    e4 d) r |
    R2. |
    r4 cis'4-. cis-. |
    d4-. r r |
    \mBreak 
    
    % cl1 page 4 line 1
    \barNumberCheck #296
    R2.*14 |
    
  }

  
}

clarinet_II_main = {
  \relative c' {
    \transposition b
    \key b \major
    \defaultTimeSignature
    \time 3/4
    \tempo "Moderato" 4 = 112

    % cl2 page 1 line 1
    \barNumberCheck #1
  }
}


\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          \clarinet_I_main
        }
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          \clarinet_II_main
        }
      }
    }
  }
}
