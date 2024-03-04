\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "10 Peer Gynts Heimkehr"
  subtitle = "Peer Gynt"
  composerShort = "Edvard Grieg"
  composer = "Edvard Grieg (1843 - 1907)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 18)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
ffSempre = _\markup { \dynamic ff \italic "sempre" }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
ffp = _\markup { \dynamic { ffp } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
sempreCresc = _\markup { \italic "sempre cresc." }
ppEspr = _\markup { \dynamic pp \italic "espr." }
ppiuEspress = _\markup { \dynamic p \italic "più espress." }
pocoCresc = _\markup { \italic "poco cresc." }
mfEspress = _\markup { \dynamic mf \italic "espress." }
pEspress = _\markup { \dynamic p \italic "espress." }
string = ^\markup { \italic "string." }
stringendo = ^\markup { \italic "stringendo" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
rall = ^\markup {\italic {"rall."} }
riten = ^\markup {\italic {"riten."} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
aTempo = ^\markup { \italic {"a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
pocoRiten = ^\markup {\italic {"poco riten."} }
sec = ^\markup {\italic {"sec."} }
pocoRall = ^\markup {\italic {"poco rall."} }
pocoAPocoRall = ^\markup {\italic {"poco a poco rall."} }
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }

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
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    \if \should-print-page-number \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  oddFooterMarkup = \markup
  \fill-line \fontsize #-2.0 {
    " "
    \fromproperty #'header:version
    " "
  }
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  
}

% This allows the use of \startMeasureCount and \stopMeasureCount
% See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
\layout {
  \context {
    \Staff
    \consists #Measure_counter_engraver
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Allegro agitato."
  \key c \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    a2.->~\f |
    a8 r r r4 r8 |
    a2.->~ |
    a8 r r r4 r8 |
    e'4.->~(\p e8 f d |
    e4.->~ e8 f d |
    \mBreak

    % cl1 p1 2
    e8\< f d e f d |
    e4.\! a4) r8 |
    a,2.->~\f |
    a8 r r r4 r8 |
    a2.->~ |
    a8 r r r4 r8 |
    \mBreak

    % cl1 p2 1
    f'4.->~(\p f8 g e |
    f4.->~ f8 g e |
    f8\< g e f g e\! |
    f4. c'4) r8 |
    a,2.->~\f |
    a8 r r r4 r8 |
    d4.~(\p d8 e\< cis |
    \mBreak

    % cl1 p2 2
    d4. a'4)\! r8 |
    a,2.->~\f |
    a8 r r r4 r8 |
    f'4.->~(\p f8 g\< e |
    f4. h4)\! r8 |
    h4-.\p r8 r4 r8 |
    R2. |
    \mark #1
    h'4.:8->\f\> h4.:8 |
    \mBreak

    % cl1 p2 3
    h4.:8 h4.:8 |
    h8\! r r r4 r8 |
    R2. |
    f4.:8-> f4.:8\dim |
    f4.:8 f4.:8 |
    e8\p r r r4 r8 |
    e8 r r r4 r8 |
    \mBreak

    % cl1 p2 4
    h8\dim r r r4 r8 |
    gis8 r r r4 r8 |
    R2.*2 |
    r4 h8\pp h8-.[ r e-.] |
    e8-.[ r h'-.] h4.-> |
    R2.*6 |
    r4 g,8 g8-.->[ r c-.] |
    \mBreak

    % cl1 p2 5
    c8-.[ r g'-.] g4.-> |
    R2.*4 |
    r4 fis,8 fis8-.->[ r c'] |
    c8-.[ r fis-.] fis4.-> |
    R2.*6 |
    a,2.~(\p |
    a4.\cresc gis4.)\! |
    e'2.~ |
    e2.~\< |
    \mBreak

    % cl1 p2 6
    e2.~\! |
    e2.(\> |
    dis4)\p r8 r4 r8 |
    R2. |
    \mark #2
    c'2.->~\f\> |
    c2.( |
    h8)\! r8 r r4 r8 |
    R2. |
    e,4.:8->\mf e4.:8 |
    e4.:8\> e4.:8\! |
    \mBreak

    % cl1 p2 7
    dis8\p r r r4 r8 |
    fis8-. r r r4 r8 |
    dis8-.\dim r r r4 r8 |
    h8-.\! r r r4 r8 |
    R2.*4 |
    f2.~\fp |
    f2.~ |
    \mBreak

    % cl1 p2 8
    f8 r r r4 r8 |
    R2.*5 |
    g2.~\fp |
    g2.~ |
    g8 r r r4 r8 |
    R2. |
    a2.~\fp |
    a2.~ |
    a8 r r r4 r8 |
    \mBreak

    % cl1 p2 9
    R2. |
    h2.~\fp |
    h2.~ |
    h8 r r r4 r8 |
    R2. |
    cis4.~->\cresc cis4 r8 |
    R2. |
    dis4.~-> dis4 r8 |
    R2. |
    \mBreak

    % cl1 p2 10
    \mark #3
    c'8(\fff h b a as g |
    ges8 f e es d des |
    c8 h b a\> as g |
    ges8 f e es d des) \! |
    R2.*4 |
    \mBreak

    % cl1 p2 11
    c''8(\fff h b a as g |
    ges8 f e es d des |
    c8 h b a\> as g |
    ges8 f e es d des) \! |
    R2.*4 |
    \mBreak

    % cl1 p3 1
    f'4.:8\ff f4.:8 |
    f4.:8 f4.:8 |
    f8 r r r4 r8 |
    R2. |
    e4.:8 e4.:8 |
    e4.:8 e4.:8 |
    e8 r r r4 r8 |
    R2. |
    d4.:8-> d8 r r |
    d4.:8-> d8 r r |
    \mBreak

    % cl1 p3 2
    e8-> r r e8-> r r |
    dis8-> r r e8-> r r |
    \mark #4
    c4.:8\ff c4.:8 |
    c4.:8 c4.:8 |
    c4.:8 c4.:8 |
    c4.:8 c4.:8 |
    r4 \after 16\! a'8(\< b4.~\ffp |
    b8 a as g ges f |
    \mBreak

    % cl1 p3 3
    e8 es d cis\< d dis |
    e8 f fis\! g) r r |
    d4.:8\ff d4.:8 |
    d4.:8 d4.:8 |
    d4.:8 d4.:8 |
    d4.:8 d4.:8 |
    r4 \after 16\! e8(\< f4.~\fp |
    f8 e es d des c |
    \mBreak
    
    % cl1 p3 4
    h8 b a gis\< a b |
    h8 c cis d)\f r r |
    \mark #5
    R2.*4 |
    g,2.->~\p\> |
    g8 r\! r r4 r8 |
    R2.*6 |
    d2.->~\p\> |
    d8 r\! r r4 r8 |
    R2.*2 |
    \mark #6
    R2.*12 |
    \mBreak

    % cl1 p3 5
    c'2.~\pp |
    c2.( |
    d2.)~ |
    d2.~ |
    d2.~ |
    d2.(\< |
    des2.)(\rit |
    c2.) _\markup \italic "molto" |
    h2.\ff->\>~ |
    h2.~ |
    h2.~\p\> |
    h2.~ |
    h4 r8\! r4 r8 |
    R2.\fermata _\markup \italic "attacca" |
    \bar "|."
    \mBreak

  }
}

clarinet_II = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Allegro agitato."
  \key c \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    a2.->~\f |
    a8 r r r4 r8 |
    a2.->~ |
    a8 r r r4 r8 |
    R2.*4 |
    a2.->~\f |
    a8 r r r4 r8 |
    \mBreak

    % cl2 p1 2
    a2.->~ |
    a8 r r r4 r8 |
    R2.*4 |
    a2.->~\f |
    a8 r r r4 r8 |
    R2.*2 |
    a2.->~\f |
    a8 r r r4 r8 |
    R2.*2 |
    \mBreak

    % cl2 p1 3
    gis'4-.\p r8 r4 r8 |
    R2. |
    \mark #1
    a'4.:8->\f\> a4.:8 |
    a4.:8 a4.:8 |
    gis8\! r r r4 r8 |
    R2. |
    h,4.:8-> h4.:8\dim |
    h4.:8\!\> h4.:8 |
    h8\p r r r4 r8 |
    \mBreak

    % cl2 p1 4
    h8 r r r4 r8 |
    gis8\dim r\! r r4 r8 |
    e8 r r r4 r8 |
    R2.*21 |
    <<
      { 
        \override MultiMeasureRest.staff-position = #-6
        R2.*2
        \cueClefUnset |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \stemDown 
        r4 \cueClef "bass" a,8^"Fagott" a[ r dis]  |
        dis8[ r a'8] a4. |
        \stemNeutral |
      }
    >>
    R2. |
    \mBreak

    % cl2 p1 5
    fis2.(\p\cresc |
    e2.)\! |
    g2.~ |
    g2.~\< |
    g2.(\! |
    fis2.~)\> |
    fis4\p r8 r4 r8 |
    R2. |
    \mark #2
    c'2.->~\f\> |
    c2.( |
    h8)\! r8 r r4 r8 |
    R2. |
    \mBreak

    % cl2 p1 6
    fis4.:8->\mf fis4.:8 |
    fis4.:8\> fis4.:8\! |
    fis8\p r r r4 r8 |
    dis'8-. r r r4 r8 |
    h8-.\dim r\! r r4 r8 |
    fis8-. r r r4 r8 |
    R2.*4 |
    \mBreak

    % cl2 p1 7
    d2.~\fp |
    d2.~ |
    d8 r r r4 r8 |
    R2.*5 |
    e2.~\fp |
    e2.~ |
    e8 r r r4 r8 |
    R2. |
    fis2.~\fp |
    fis2.~ |
    \mBreak

    % cl2 p1 8
    fis8 r r r4 r8 |
    R2. |
    gis2.~\fp |
    gis2.~ |
    gis8 r r r4 r8 |
    R2. |
    ais4.~->\cresc ais4 r8 |
    R2. |
    his4.~-> his4 r8 |
    R2. |
    \mBreak

    % cl2 p1 9
    \mark #3
    e8(\fff dis d cis c h |
    b8 a gis g fis f |
    e8 dis d cis\> c h |
    b8 a gis g fis f) \! |
    R2.*4 |
    \mBreak

    % cl2 p2 1
    e''8(\fff dis d cis c h |
    b8 a gis g fis f |
    e8 dis d cis\> c h |
    b8 a gis g fis f) \! |
    R2.*4 |
    \mBreak

    % cl2 p2 2
    c''4.:8\ff c4.:8 |
    c4.:8 c4.:8 |
    d8 r r r4 r8 |
    R2. |
    h4.:8 h4.:8 |
    h4.:8 h4.:8 |
    c8 r r r4 r8 |
    R2. |
    \mBreak

    % cl2 p2 3
    a4.:8-> a8 r r |
    gis4.:8-> gis8 r r |
    c8-> r r c8-> r r |
    h8-> r r h8-> r r |
    \mark #4
    a4.:8\ff a4.:8 |
    a4.:8 a4.:8 |
    \mBreak

    % cl2 p2 4
    a4.:8 a4.:8 |
    a4.:8 a4.:8 |
    r4 \after 16\! a8(\< b4.~\ffp |
    b8 a as g ges f |
    e8 es d cis d\< dis |
    \mBreak

    % cl2 p2 5
    e8 f fis\! g)\f r r |
    a4.:8\ff a4.:8 |
    a4.:8 a4.:8 |
    a4.:8 a4.:8 |
    a4.:8 a4.:8 |
    r4 \after 16\! e8(\< f4.~\ffp |
    \mBreak

    % cl2 p2 6
    f8 e es d des c |
    h8 b a gis a\< b |
    h8 c cis d)\f r r |
    \mark #5
    R2.*4 |
    e2.->~\p\> |
    \mBreak

    % cl2 p2 7
    e8 r\! r r4 r8 |
    R2.*6 |
    h2.->~\p\> |
    h8 r\! r r4 r8 |
    R2.*2 |
    \mark #6
    R2.*25 \rit |
    R2.\fermata _\markup \italic "attacca" |
    \bar "|."
    \mBreak
  }
}



% ---------------------------------------------------------

%{
\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      <<
      {
        \transpose a a \clarinet_I
      }
      \\
      {
        \transpose a a \clarinet_II
      }
      >>
    }
  }
}
%}

\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_I
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
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_II
      }
    }
  }
}
