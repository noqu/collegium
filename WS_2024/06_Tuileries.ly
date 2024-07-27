\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "3. Tuileries"
  subtitle = ""
  composerShort = "Modest Mussorgsky"
  composer = "Modest Mussorgsky (1839 - 1881)"
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
espress = _\markup { \italic "espress." }
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
  markup-system-spacing.basic-distance = #5
  markup-system-spacing.minimum-distance = #5
  markup-system-spacing.padding = #5
  % Distance between music systems
  system-system-spacing.basic-distance = #14
  system-system-spacing.minimum-distance = #14
  % system-system-spacing.padding = #10
}

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveEmptyStaves
    % \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Allegretto non troppo capriccioso"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p4 1
    d4->\p d8-. r d4-> d8-. r |
    \repeat unfold 3 { d4-> d8-. r d4-> d8-. r | }
    h4(-> fis8-.) r h4(-> fis8-.) r |
    \mBreak
    
    % cl1 p4 2
    d'4-> d8-. r d4-> d8-. r |
    h4->(\< fis8-.) r h4->( fis8-.) r |
    \mark #34
    c''4->(\mf\< fis,8-.) r c'8->( e16 d) c( b a g) |
    c4->( fis,8-.) r c'8->( e16 d) c( b a g) |
    \mBreak
    
    % cl1 p4 3
    g'16(\ff\> fis e d c h a g) gis8( a h e,)\! |
    d4->\p d8-. r d4-> d8-. r |
    d4-> d8-. r d4-> d8-. r |
    cis,16( d eis fis gis a cis d eis fis gis a) r4 |
    \bar "||"
    \mBreak

    % cl1 p4 4
    \mark #35
    R1
    r2 r8 d16(\mf h a f d a-.) |
    R1*3 |
    r2 r4 cis16(\p\solo d e f |
    \mark 36
    b4~ b16 a c b) e,( f fis g a g c b) |
    \mBreak
    
    % cl1 p4 5
    b4~(\< b16 a c b) e,( f fis g a g a b) |
    a4->\mf d,16(\< dis e f) a4-> d,16( dis e f?) |
    c'4->(\f fis,8-.) r c'4->( fis,8-.) r |
    c'4->(\ff fis,8-.) r c'4->( fis,8-.) r |
    d4~->\p d8-. r d4->~ d8-. r |
    \mBreak
    
    % cl1 p4 6
    \mark #37
    % Extra accidentals for g make no sense here - no gis anywhere to be seen
    g'4(\< fis8 e ais,\> h e fis) |
    d,4->\pp d8-. r d4-> d8-. r |
    d4->~ d8-. r d4->~ d8-. r |
    cis4->(d8-.) r eis16( fis eis fis gis a cis d |
    fis8) r8 r4 r2 |
    \bar "|."
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Allegretto non troppo capriccioso"
  \key d \major
  \clef violin
  \relative c'' {
    % cl2 p4 1
    fis,4->\p fis8-. r fis4-> fis8-. r |
    \repeat unfold 3 {  fis4-> fis8-. r fis4-> fis8-. r | }
    \mBreak

    % cl2 p4 2
    R1 |
    h4-> h8-. r h4-> h8-. r |
    R1 |
    \mark #34
    e4->~\mf\< e8-. r c'8->( e16 d) c( b a g) |
    e4->~ e8-. r c'8->( e16 d) c( b a g) |
    \mBreak

    % cl2 p4 3
    g'16\ff r r8 r4 h,,,16(\mf\> his cis d dis e g gis) |
    fis4->~\p fis8-. r fis4->~ fis8-. r |
    fis4->~ fis8-. r fis4->~ fis8-. r |
    R1 |
    \bar "||"
    \mark #35
    R1*6
    \mBreak
    
    % cl2 p4 4
    \mark 36
    R1*2^"Cl.I"
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \relative {
        \stemUp
        \voiceOne
        a''4->\mf d,16(\< dis e f) a4-> d,16( dis e f\!) |
        \stemNeutral
      }
    >>
    e'4->~\f e8-. r e4->~ e8-. r |
    e4->~\ff e8-. r e4->~ e8-. r |
    h4->(\p a8-.) r h4->( a8-.) r |
    \mBreak
    
    % cl2 p4 5
    \mark #37
    g'4(\< fis8 e ais,\> h e fis) |
    fis,4->~\pp fis8-. r fis4->~ fis8-. r |
    fis4->~ fis8-. r fis4->~ fis8-. r |
    cis16( d eis fis gis a cis d eis) r16 r8 r4 |
    R1 |
    \bar "|."
  }
}

% ---------------------------------------------------------

%{
\bookpart {
  \header{
    instrument = "Klarinette I und II in Bb"
  }
  \score {
    \new GrandStaff <<
      \new Staff {
        \transpose b a \clarinet_I
      }
      \new Staff {
        \transpose b a \clarinet_II
      }
    >>
  }
}
%}

\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \transpose a a \clarinet_I
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \transpose a a \clarinet_II
    }
  }
}

