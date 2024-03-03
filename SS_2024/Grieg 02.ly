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
  title = "Peer Gynt"
  subtitle = "Norwegischer Brautzug im Vorüberziehen"
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
  \time 2/4
  \tempo "Alla marcia."
  \key g \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    R2*16 |
    \mark #1
    R2*8 |
    \mark #2
    % FIXME: Add oboe cue notes
    R2 |
    R2 |
    \mBreak

    % cl1 p1 2
    % FIXME: Add oboe cue notes
    R2 |
    r4 r8.. a''32\mf |
    a16[ r32 g32 g16 r32 g32] h8[ r16. g32] | 
    \mBreak
    
    % cl1 p1 3
    g16[ r32 fis32 fis16 r32 f32] a8[ r16. f32] | 
    f16[ r32 e32 e16 r32 e32] h'16[ r32 e,32 e16 r32 e32] | 
    e16[ r32 d32 d16 r32 d32] d8 r |
    \mBreak
    
    % cl1 p1 4
    r4 a,8(\p\< h\fz\> |
    \after 4 \! a2) |
    r4 a16.\< d32( h16.) d32\>( |
    \after 4 \! a2) |
    R2*4 |
    \mBreak
    
    % cl1 p1 5
    \mark #3
    b''16.-.\prall\mf a32-. g16.-. a32-. b4~\< |
    b2\f |
    b16.-.\prall\mf a32-.\cresc g16.-. a32-. b4~ |
    b2\ff |
    R2*4 |
    \mBreak
    
    % cl1 p1 6
    des,2(\pp |
    c2) |
    des2(\< |
    \after 8\! c4.) r8 |
    R2 |
    c16.\mf\> as32( c16.) es32( c16.) as32( c16.) es32\! |
    \mBreak
    
    % cl1 p1 7
    c8 r r4 |
    \mark #4
    r8 a\pp r4 |
    r8 as r4 |
    r8 a r4 |
    r8 as r4 |
    R2 |
    \mBreak
    
    % cl1 p1 8
    \tuplet 3/2 { e'16[ _\markup \italic "cresc. poco a poco" c e] } \tuplet 3/2 { g16([ h a)] } g16.[ e32] \tuplet 3/2 { c16([ d fis)] } |
    e16. c32( a16.) c32( a16.-.) g32( a16.-.) g32( |
    e8-.) r r8.. g'32(\mf |
    \mBreak
    
    % cl1 p1 9
    e16.) c32( a16.) g'32( e16.-.) c32( a16.-.) g'32( |
    e16.) c32( a16.) g'32( e16.-.) c32( a16.-.) h32( |
    a16.) fis32( d16.) h''32( a16.-.) fis32-. f16.-. e32-. |
    \mBreak
    
    % cl1 p1 10
    es16.-. d32-. cis16.-. c32-. h16.-. b32-. a16.-. as32-.
    \mark #5
    g8\ff r r4 |
    r4 r8.. d''32\ffSempre |
    \mBreak

    % cl1 p2 1
    \appoggiatura { c16 d } c16.-> h32-. c16.-. e32-. a,8..-> c32 |
    \appoggiatura { h16 c } h16.-> a32-. h16.-. d32-. g,8..-> g32 |
    fis16.-. d32-. fis16.-. c'32-. fis,16.-. d32-. fis16.-. d32-. |
    \mBreak

    % cl1 p2 2
    g8-. g4-> r16. d'32( |
    \appoggiatura { c16 d } c16-> a16-. c16-.) e16-. r8.. c32( |
    \appoggiatura { h16 c } h16-> g16-. h16-.) d16-. r8.. g,32( |
    \mBreak

    % cl1 p2 3
    fis16.-.) d32-.( fis16.-.) c'32-.( fis,16.-.) d32-.( fis16.-.) d32-.( |
    g8-.) g4-> r8 |
    a16.-. fis32-.( a16.-.) e'32-.( a,16.-.) fis32-.( a16.-.) fis32-.( |
    \mBreak

    % cl1 p2 4
    g8-.) g4-> r8 |
    \mark #6
    r8 cis,\ff r cis |
    r8 cis r cis |
    r4 r8 e'->~ |
    e4 r |
    \mBreak

    % cl1 p2 5
    c,16.-.->\ff h32-. c16.-. e32-. a,8..-> h32 |
    c16.-.-> h32-. c16.-. e32-. a4->~ |
    a8 r r4 |
    r8 a4-> a,8->~ |
    \mBreak

    % cl1 p2 6
    a4 r |
    r4 r8 a->~ |
    a8 c'4-> c,8->~ |
    c8 c'4-> c,8->~ |
    c8 c4-> c'8->~ |
    \mBreak

    % cl1 p2 7
    c8 d,32( cis d e fis g a h c d e fis |
    \mark #7
    g8-.) r r4 |
    R2 |
    r8 a,8-.\ff a4-> |
    \mBreak

    % cl1 p2 8
    r8 a8-. a4-> |
    r8 c,16.\ff d32 \tuplet 3/2 { e16([ g c] } \tuplet 3/2 { h16[ g h] } |
    \tuplet 3/2 { a16[ f a]) } g16. f32( e16.) c32( g16-.) r16 |
    \mBreak

    % cl1 p2 9
    r8 fis'8-. fis4-> |
    r8 fis-. fis4->( |
    g8) r r4 |
    R2 |
    \mark #8
    R2*2 |
    \mBreak

    % cl1 p2 10
    r8 c,,16.\mf d32 \tuplet 3/2 { e16([ g c] } \tuplet 3/2 { h16[ g h] } |
    \tuplet 3/2 { a16[ f a]) } g16. f32( e16.) c32( g16-.) r16 |
    R2*2 |
    \mBreak

    % cl1 p2 11
    d''8-.\p d-. d4-> |
    d8-. d-. d4->~\> |
    d2\pp\>~ |
    d4.\! r8 |
    R2*16
    \bar "|."
    \mBreak

  }
}

clarinet_II = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Moderato assai."
  \key c \major
  \clef violin
    \relative c' {
    % cl2 p1 1
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
        \transpose a a \clarinet_I
      }
    }
  }
}

%{
\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose a a \clarinet_II
      }
    }
  }
}
%}