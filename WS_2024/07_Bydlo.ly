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
  title = "IV Bydlo"
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
pocoDim = _\markup { \italic "poco dim." }
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
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  
}

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveEmptyStaves
    \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Sempre moderato pesante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p10 1
    R2*9
    \mark #38
    R2*4
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*7 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \clef bass
        \stemUp
        c'4(^"Tuba" e8) r |
        \mBreak
        
        % cl1 p10 2
        e4_"Tuba" e-- |
        d2~( |
        d4 his8) r |
        c4( g'8) g |
        d8-- h-- a4--( |
        g4~ g8) r |
        \stemNeutral
        \clef violin
      }
    >>
    \mBreak
    
    % cl1 p10 3
    \mark #39
    c4--\mf\cresc a--\! |
    g4-- c,-- |
    c'4--^"simile" a-- |
    g4 c, |
    g'8-- e-- fis^"simile" d |
    e8 c c4 |
    \mBreak
    
    % cl1 p10 4
    \mark #40
    e4 c |
    e4 d |
    c'4 f, |
    e'4 fis |
    g8( h) f4 |
    \mark #41
    dis4 \pocoDim e8( h) |
    \mBreak
    
    % cl1 p10 5
    e4 e |
    e4 fis |
    cis2\< |
    d8 r h'4 |
    g4 fis8 d|
    \mark #42
    h8 r fis4~\fff |
    % Avoid line break here because otherwise the slur hangs empty
    fis8 a16 g fis8-- g |
    \mBreak
    
    % cl1 p10 6
    % By starting the " a 2" a bar later, we avoid the hanging slur
    fis8--^"a 2" h-- cis-- d-- |
    cis4-> h8-- r |
    e4->( h'8) r |
    e,4->(\pocoDim\> h'8) h |
    fis4-- e-- |
    \mBreak
    
    % cl1 p10 7
    d8( fis cis4-.) |
    h4--( a8 g |
    \mark #43
    fis8)\! r r4 |
    R2*3
    \mark #44
    R2*8 |
    \mark #45
    R2*6

    % Magic taken from https://lsr.di.unimi.it/LSR/Item?id=10
    % for a fermata hovering over the last bar line
    \context Staff = "one" {
      \bar "|."
      \override Score.TextMark.self-alignment-X = #CENTER
      \textEndMark \markup { \musicglyph "scripts.ufermata" }
    }
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Sempre moderato pesante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl2 p10 1
    R2*14 |
    \mBreak

    % cl2 p10 2
    R2*6 |
    
    % cl2 p10 3
    \mark #39
    e,,4--\mf\cresc fis--\! |
    g4-- a-- |
    e4^"simile" fis |
    g4 a |
    e4-- fis-- |
    g4 a4 |
    \mBreak

    % cl2 p10 4
    \mark #40
    e4 a |
    e4 h'8( a)|
    e4 a |
    c'4 dis |
    e4 c |
    \mark #41
    h4 \pocoDim h |
    \mBreak

    % cl2 p10 5
    fis4 g |
    fis4 c' |
    ais2\< |
    h8 r fis'4 |
    e4 d |
    \mark #42
    h8 r fis4~\fff |
    % Avoid line break here because otherwise the slur hangs empty
    fis8 a16 g fis8-- g |
    \mBreak
    
    % cl2 p10 6
    R2*25 |

  }
}

clarinet_bass = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Sempre moderato pesante"
  \key d \major
  \clef violin
  \relative c'' {
    % clb p4 1
    R2*9
    \mark #38
    R2*4
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*7 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \clef bass
        \stemUp
        \voiceOne
        c'4(^"Tuba" e8) r |
        e4 e-- |
        d2~( |
        d4 his8) r |
        c4( g'8) g |
        d8-- h-- a4--( |
        g4~ g8) r |
        \stemNeutral
        \clef violin
      }
    >>
    e,,4--\mf\cresc fis--\! |
    g4-- a-- |
    e4-- fis-- |
    g4-- a-- |
    e4-- fis-- |
    % Extra accidentals make no sense here (no gis/ais but loads of g/a around)
    g4-- a-- |
    \mBreak
    
    % clb p4 3
    \mark #40
    e4 a |
    e4 a |
    e4 a |
    a4 h |
    h4 a |
    \mark #41
    h4 \pocoDim e |
    e4 e |
    \mBreak
    
    % clb p4 4
    e4 fis |
    fis4\< cis |
    fis4 fis, |
    h4 ais |
    \mark #42
    h8\! r fis'4~\fff |
    fis8 a16 g fis8-- g-- |
    \mBreak
    
    % clb p5 1
    fis8-- h-- cis-- d-- |
    cis4-> h8-- r |
    e,,8 g h d |
    e,8\pocoDim\> g h d  |
    fis'4-- e-- |
    \mBreak
    
    % clb p5 2
    d8( fis cis4-.) |
    h4-- a8( g |
    \mark #43
    fis8)\! r r4 |
    R2*3
    \mark #44
    R2*6 |
    <<
      {
        R2*2 |
      }
      % Transposition adapted to clarinet (written in Bb ??) 
      \new CueVoice \transpose a b \relative {
        \stemDown
        \voiceTwo
        r4 eis~\mp^"Horn m.Dämpfer" |
        \mBreak

        % clb p5 3
        eis8 gis16 fis eis8 fis |
        \stemNeutral
      }
    >>
    \mark #45
    R2*2 |
    r4 fis4~\pp\solo^"Clar.Bass" |
    fis8 r r4 |
    R2*2 |
    \bar "|."
  }
}

% ---------------------------------------------------------

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

\bookpart {
  \header{
    instrument = "Bassklarinette in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \clarinet_bass
    }
  }
}
