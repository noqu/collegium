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
  title = "Sinfonie No. 8 G-Dur"
  subtitle = ""
  composerShort = "Antonin Dvorák"
  composer = "Antonin Dvorák (1841 - 1904)"
  tagline = "Op. 88"
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
stringendo = ^\markup { \italic "stringendo" }
allargando = _\markup { \italic "allargando" }
pocoRit = _\markup {\italic {"poco rit."} }
rit = _\markup {\italic {"rit."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuTranquillo = ^\markup { \italic "Più tranquillo" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \bold { "Tempo I" } }

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
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  % markup-system-spacing.basic-distance = #12
  % markup-system-spacing.minimum-distance = #12
  % markup-system-spacing.padding = #10
  
}

% ---------------------------------------------------------

clarinet_II_AllegroConBrio = {
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Allegro con brio"
  \key b \major
  \relative c' {
    % m1 page 1 line 1
    f2( \p \< f4 f4 |
    b2. \> as4 |
    f2) \! ges4( es |
    des4 \< f as4. g8 |
    f2 \> \tuplet 3/2 { es4 ges f } |
    des2) \p r4 des \pp |
    \mBreak

    % m1 page 1 line 2
    des2 des4 des |
    des2.( es8 \< f |
    ges4 ges-- ges--  \! ges-- |
    ges2 \> as2 |
    ges2) r4 \! ges \pp |
    ges2( ges4-- ges-- |
    ges2 f4 es) |
    \mBreak

    % m1 page 1 line 3
    des2( es |
    f1~) \dim |
    f1~ \> |
    f1~ \ppp |
    f4 r4 r2 |
    R1*9 |
    \mark 1
    f8 \pp r8 f8[ r16 c] f8 r8 r8 c |
    \mBreak

    % m1 page 1 line 4
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    f8 \cresc r8 \! f8[ r16 c] f8 r8 r8 c |
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    f8 r8 f8[ r16 c] f8 r8 r8 c |
    \mBreak

    % m1 page 1 line 5
    a'1~ \fz \startTrillSpan |
    a1~ |
    a1 \stopTrillSpan |
    a8 es'-. \ff g-. c,-. es-. r8 r4 |
    r8 c-. \f es-. g,-. c-. f-. r4 |
    r4 f,8 \f r8 r2 |
    \mark #2 
    R1*3 |
    b,2.( \p g8 b8 ) |
    b1~ |
    \mBreak

    % m1 page 1 line 6
    b2. es8-.( f-.) |
    g4 \cresc g2 \!  es8( \< f |
    g8) g-. \! g2 \f \tuplet 3/2 { es8( f g) } |
    g4. \f r8 a4. r8 |
    d8-. \f a16( c b8) fis16( a g8) d16( f es8) \tuplet 3/2 { c'16([ es g)] } |
    \mBreak

    % m1 page 1 line 7
    g8-. \piuF g-. g-. f16( \< g a8) \f a-. a-. gis16( \< a |
    d8) c,16( \! es d8) a16( c b8) f16( as g8) r8 |
    des'8-. \ff des-. des-. r8 r2 |
    des8-. des-. des-. r8 r2 |
    \mBreak

    % m1 page 1 line 8
    d8 \f r r4 d8 r r4 |
    d8 r e r e r e r |
    f4. r8 b,4 r |
    c8 r r4 a8-. a-. b-. c-. |
    \mark #3
    b2 \ff b2 |
    \mBreak

    % m1 page 1 line 9
    d8 r d r d r d r |
    d8 r d r r4 b8 r |
    d8 r8 r4 r2 |
    r2 r4 cis8. \ff \> d16 |
    f2~ f8 r8 \! r4 |
    R1*9 |
    \mBreak

    % m1 page 2 line 1
    \mBreak

    % m1 page 2 line 2
    \mBreak

    % m1 page 2 line 3
    \mBreak

    % m1 page 2 line 4
    \mBreak

    % m1 page 2 line 5
    \mBreak

    % m1 page 2 line 6
    \mBreak

    % m1 page 2 line 7
    \mBreak

    % m1 page 2 line 8
    \mBreak

    % m1 page 2 line 9
    \mBreak

    % m1 page 2 line 10
    \mBreak

    % m1 page 2 line 11
    \mBreak

    % m1 page 3 line 1
    \mBreak

    % m1 page 3 line 2
    \mBreak

    % m1 page 3 line 3
    \mBreak

    % m1 page 3 line 4
    \mBreak

    % m1 page 3 line 5
    \mBreak

    % m1 page 3 line 6
    \mBreak

    % m1 page 3 line 7
    \mBreak

    % m1 page 3 line 8
    \mBreak

    % m1 page 3 line 9
    \mBreak

    % m1 page 3 line 10
    \mBreak

    % m1 page 4 line 1
    \mBreak

    % m1 page 4 line 2
    \mBreak

    % m1 page 4 line 3
    \mBreak

    % m1 page 4 line 4
    \mBreak

    % m1 page 4 line 5
    \mBreak

    % m1 page 4 line 6
    \mBreak

    % m1 page 4 line 7
    \bar "|."
  }
}

clarinet_II_AllegroNonTroppo = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegro non troppo"
  \key b \major
  \relative c'' {
    % m4 page 1 line 1
    \mBreak

    % m4 page 1 line 2
    \mBreak

    % m4 page 1 line 3
    \mBreak

    % m4 page 1 line 4
    \mBreak

    % m4 page 1 line 5
    \mBreak

    % m4 page 1 line 6
    \mBreak

    % m4 page 1 line 7
    \mBreak

    % m4 page 2 line 1
    \mBreak

    % m4 page 2 line 2
    \mBreak

    % m4 page 2 line 3
    \mBreak

    % m4 page 2 line 4
    \mBreak

    % m4 page 2 line 5
    \mBreak

    % m4 page 2 line 6
    \mBreak

    % m4 page 2 line 7
    \mBreak

    % m4 page 2 line 8
    \mBreak

    % m4 page 2 line 9
    \mBreak

    % m4 page 2 line 10
    \mBreak

    % m4 page 2 line 11
    \mBreak

    % m4 page 2 line 12
    \mBreak

    % m4 page 3 line 1
    \mBreak

    % m4 page 3 line 2
    \mBreak

    % m4 page 3 line 3
    \mBreak

    % m4 page 3 line 4
    \mBreak

    % m4 page 3 line 5
    \mBreak

    % m4 page 3 line 6
    \mBreak

    % m4 page 3 line 7
    \mBreak

    % m4 page 3 line 8
    \mBreak

    % m4 page 3 line 9
    \mBreak

    % m4 page 3 line 10
    \mBreak

    % m4 page 3 line 11
    \bar "|."
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \transpose a a \clarinet_II_AllegroConBrio
  }
  \score {
    \transpose a a \clarinet_II_AllegroNonTroppo
  }
}
