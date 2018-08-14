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
mBreak = {}
% mBreak = { \break }
% #(set-global-staff-size 13)

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

% Taken from LSR http://lsr.di.unimi.it/LSR/Item?id=772
% Add multiple staccato dots to a tremolo-abbreviated note
% Usage: \repeat tremolo 3 c8-\tongue #3
tongue =
#(define-music-function (parser location dots) (integer?)
  #{
    \tweak stencil
      #(lambda (grob)
        (let ((stil (ly:script-interface::print grob)))
          (let loop ((count (1- dots)) (new-stil stil))
            (if (> count 0)
                (loop (1- count)
                      (ly:stencil-combine-at-edge new-stil X RIGHT stil 0.2))
                (ly:stencil-aligned-to new-stil X CENTER)))))
     \staccato
  #})

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

% Taken from LSR http://lsr.di.unimi.it/LSR/Item?id=266
% Minimize usage of accidentals (no double accidentals, no his, eis, ces, fes)
% Usage: \naturalizeMusic \transpose {...}
#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eq? n 6) (eq? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eq? n 0) (eq? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))
#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map (lambda (x) (naturalize x)) es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))
naturalizeMusic =
#(define-music-function (parser location m)
   (ly:music?)
   (naturalize m))

clarinet_I_in_A_part_one_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % cl 1 page 1 line 1
    \barNumberCheck #1
    R1*13 |
    d1->\f\>~ |
    d1~ |
    d1~ |
    d2\! r2 |
    d1\p~ |
    d1 |
    d1~ |
    d1~\> |
    \mark #1
    d4\! r4 r2 |
    R1*12 |
    \forceBarNumber
    b1->\mf\>~ |
    b1~ |
    b2\pp r2 |
    R1 |
    \mBreak
    
    % cl 1 page 1 line 2
    \barNumberCheck #39
    g''4.\p\solo g8 g( f e d) |
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
    g4( b a g) |
    \mBreak
    
    % cl 1 page 1 line 3
    \barNumberCheck #52
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
    
    % cl 1 page 1 line 4
    \barNumberCheck #60
    a8-. r r a16( h) c d c h |
    a16 h a c h\< c h c\sic %{ SIC: Neither clarinet 2 nor score have staccato here %} h c h c |
    d8-.\sf a16( h) c d c h a h a g |
    a8 a16( h) c d c h a h a g |
    \mBreak
    
    % cl 1 page 1 line 5
    \barNumberCheck #64
    a8 r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    c8\sf c, b4 b8( a) |
    b8 b b4 b8( a) |
    b8 b b( a) b16( a g8) |
    \mBreak

    % cl 1 page 1 line 6
    \barNumberCheck #69
    b8 b b4 c8( e) |
    R2.*4 |
    \mark #3
    c'8\f r b,16 c d es f g a b |
    a16( b) c8~ c b16 a g( f) d8 |
    r4 c'' d |
    d4\< d2\! |
    d4\< d2\! |
    c8 c,-. b c d( c16 b) |
    \mBreak
    
    % cl 1 page 1 line 7
    \barNumberCheck #80
    a8-. a-. g a b( a16 g) |
    f8 r r4 r |
    r4 r b'16(\< c b c)\! |
    d8 r8 r4 r |
    r4 r d\< |
    d8\sf r8 r4 r |
    r4 r a16(\< h a g)\! |
    a8 r8 r4 r |
    \mBreak
    
    % cl 1 page 1 line 8
    \barNumberCheck #88
    r4 r h16(\< a h c) |
    d2.\ff\>~ |
    d8\! r8 r4 r |
    d,2.\f\>~ |
    d8\! r8 r4 r |
    R2.*3 |
    h'8.\mf\< h16 h8-. h-. h-. h-. |
    \mark #4
    d8\f r16 a\ff g8\pesante a \acciaccatura { c8 } h( a16 g) |
    a8 g16( d f8) r8 r4 |
    \mBreak
    
    % cl 1 page 1 line 9
    \barNumberCheck #99
    r8. a16\pesante g8 a \acciaccatura { c8 } h( a16 g) |
    a8 g16( d f8) r8 r4 |
    r8. f16\pesante e8 f \acciaccatura { a8 } g( f16 e) |
    f8 e16( a, d8) r8 r4 |
    r8. f16\pesante e8 f \acciaccatura { a8 } g( f16 e) |
    f8 e16( a, d8) r8 r4 |
    \mBreak
    
    % cl 1 page 1 line 10
    \barNumberCheck #105
    R2. |
    r8\solo d16\p\<( e f g f e d e d c\! ) |
    b16( a g8) r4 r |
    r8 g'16(\< a b c b a g a g ges\! |
    f8) r8 r4 g\mf |
    f8 r8 r4 g |
    \mBreak
    
    % cl 1 page 1 line 11
    \barNumberCheck #111
    fis8 r8 r4 c'8(-> a) |
    d8 r8 r4 c8(-> a) |
    d8 r8 r4 r |
    r4 as8\f\< r as\! r |
    b8\sf b16\mf b b8 b16 b b8 b16 b |
    b8 b16 b b8 b16 b b8\< b16 b |
    \mBreak
    
    % cl 1 page 1 line 12
    \barNumberCheck #117
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

    % cl 1 page 2 line 1
    \barNumberCheck #134
    g''2.\p\solo~ |
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
    
    % cl 1 page 2 line 2
    \barNumberCheck #145
    a8) h( c d e a) |
    g4\mf e8( f g4~ |
    g8) g( f e d c) |
    e4 c8( d e4~ |
    e8) e( d c h a) |
    c4 as8( b c4~ |
    c8) c( b as g f) |
    as4 f8( g as4~\> |
    as4) g2(\! |
    \mBreak
    
    % cl 1 page 2 line 3
    \barNumberCheck #154
    \mark #6
    c8) r8 r4 r |
    R2. |
    b'4\pp( c b\> |
    c4 b a)\! |
    R2.*2 |
    b4( c b\> |
    c4 b a)\! |
    R2.*2 |
    g4( as g |
    as4\> g as)\! |
    R2.*7 |
    as4(\mf f8 as) as4(\> |
    \mBreak

    % cl 1 page 2 line 4
    \barNumberCheck #174
    g8) r8\! r4 r |
    as4( f8 as) as4(\> |
    g8) r8\! r4 r |
    R2. |
    \mark #7
    R2.*8 |
    \forceBarNumber
    r4 es8(\p c) d( c) |
    R2. |
    c'2(\p h4 |
    b2 a4 |
    as2 g4 |
    fis2 f4) |
    e2( dis4 |
    d2. |
    \mBreak
    
    % cl 1 page 2 line 5
    \barNumberCheck #194
    c4. h8 a4~ |
    a2.) |
    des'2(\mf c4 |
    h2 b4 |
    a2 as4\> |
    g2 fis4)\! |
    f2( e4 |
    es2 d 4 |
    des2 c4 |
    h2.) |
    \mark #8
    e,4(\p c e |
    c\< e c)\! |
    g'4( c, g' |
    c, g'\> c,)\! |
    \mBreak
    
    % cl 1 page 2 line 6
    \barNumberCheck #208
    e4( c e |
    c4 e\< c)\! |
    g'4( c, g' |
    c,4 g'\< c,)\! |
    ges'2.\cresc~ |
    ges2. |
    fes2. |
    des''2( b4) |
    g8(\f e) a( e) g( e) |
    a8( e)\> g( e) a( e) |
    g8(\mf e) a( e) g( e) |
    \mBreak
    
    % cl 1 page 2 line 7
    \barNumberCheck #219
    a8(\> e) g( e) a( e)\! |
    R2.*2 |
    \bar "||" \tempo "Allegro con brio (come prima)"
    R2.*8 |
    as4(\p c2) |
    as4( c2) |
    as4 as8( b) as( g) |
    as4 as8( b) as4 |
    g8 r8 r4 r |
    R2.*6 |
    \mark #9
    c,4(\p e2)
    c4( e2)
    \mBreak
    
    % cl 1 page 2 line 8 (start)
    \barNumberCheck #243
    c4 c8( d) c( h) |
    c4 c8( d) c( h) |
    a8 r8 r4 r |
    R2.*8 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-4
        R2.*2
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \cueClef "bass" \stemUp des,,8^"Bassi" h e4 h | des8 h e4 h | \cueClefUnset
      }
    >>
  }
}

clarinet_I_in_A_part_two_Music = {
  \relative c' {
    \transposition a
    % Transposition: Actually c major (256-294) Clarinet changes, written key doesn't
    \key g \major

    % cl 1 page 2 line 8 (continued)
    r4 a''8(\f fis) h d |
    cis8 h a( fis) h d |
    cis8 h a( fis) h4 |
    \mBreak

    % cl 1 page 2 line 9
    \barNumberCheck #259
    fis4 a8( fis) h4 |
    fis4-> a-> fis-> |
    h8-> r8 r4 r |
    \mark #11
    e4\ff e e8-. e-. |
    e4 e e8-. e-. |
    es 8 r8 es,2->\mf~ |
    es2. |
    R2.*2 |
    e8(\mf\solo cis8) fis8( cis8) e8( cis8) |
    fis8(\> cis) e( cis) fis( cis) |
    \mBreak
    
    % cl 1 page 2 line 10
    \barNumberCheck #270
    a'8(\ff fis) h( d) c-. h-. |
    a8( fis) h( d) c-. h-. |
    a8( fis) h( fis) a( fis) |
    h8(\< fis) a( fis) h( fis) |
    g8\sf\! r8 r4 r |
    R2. |
    f,,2.\p\startTrillSpan~ |
    f2 f32(\<\stopTrillSpan g a h c d e f |
    \mBreak

    % cl 1 page 2 line 11
    \barNumberCheck #278
    g2.)\mf\startTrillSpan~ |
    g2~ g8\stopTrillSpan \tuplet 6/4 { g32( a h c d e } |
    f2.)\startTrillSpan~ |
    f2\<~ f8\stopTrillSpan \tuplet 6/4 { es32( f g a b c } |
    \mark #12
    d8\!) r8 \pitchedTrill d,,2\f\startTrillSpan~ e |
    d2~ d8\stopTrillSpan \tuplet 6/4 { d32_( e fis g a h } |
    c2.)\startTrillSpan~ |
    c2\stopTrillSpan\< c32( d e fis g a h c)\! |
    \mBreak
    
    % cl 1 page 2 line 12
    \barNumberCheck #286
    a8( fis) h( d) c-. h-. |
    a8( fis) e( g) fis( a) |
    g( e) a( c) h-. a-. |
    g8( e) c(\< d) e-. d'-. |
    cis8.\ff cis16 cis4~ cis8 e,8\f |
    e8. e16 e4\>~ e8\! r8 |
    r4 r4 r8 d,\mf |
    \mBreak
    
    % cl 1 page 2 line 13
    \barNumberCheck #293
    d8. d16 d4\>~ d8\! a''8 |
    \pitchedTrill a2_~ \startTrillSpan b a8\stopTrillSpan r8 |
    % Transposition: Actually a major (295-321)
    \bar "||" % (already) \key g \major
    R2.*4 |
    fis,8.\mf fis16 fis2->~ |
    fis16 d( e fis) a( fis e fis) e( d h d) |
    d8. d16 d4. e8 |
    fis8.\< fis16 fis4. a8\! |
    cis8. cis16 cis4~ cis8 d\f |
    \mBreak
    
    % cl 1 page 2 line 14
    \barNumberCheck #304
    fis8. fis16 fis4.\< a8\! |
    cis8. cis16 cis4~ cis8 d\ff |
    \mark #13
    a8. a16 a2\> |
    R2.\pp\pocoRit |
    \tempo "Meno mosso"
    d,2\mf( cis4\> |
    his2 fis'4) |
    d2\mf( cis4\> |
    his2 fis'4) |
    e2\mf( dis4\> |
    cisis2 gis'4) |
    e2\mf( dis4\> |
    cisis2 gis'4)\! |
    \mBreak
    
    % cl 1 page 3 line 1
    \barNumberCheck #316
    fis2( dis4) |
    % Transposition: Actually dis
    d2->\mf(~ d8\> es)\! |
    fis4 dis8( eis fis4~\>) |
    fis4\! e8( fis e dis) |
    fis4( f) e->(\( |
    dis4) e\> fis\)\! |
    % Transposition: Actually c major (322-335)
    \bar "||" \key as \major
    \mark #14
    \repeat tremolo 12 { des16\mf \pocoAnimato } |
    des8 b16( c des es des c) b( c des es) |
    \repeat tremolo 12 { des16 } |
    \mBreak
    
    % cl 1 page 3 line 2
    \barNumberCheck #325
    des8 b16( c des es des c) b( c des d) |
    \repeat tremolo 12 { es16 } |
    es8 c16( d es f es d) c( d es f) |
    \repeat tremolo 12 { es16 } |
    es8 c16( d es f es d) c( cis d es) |
    \repeat tremolo 12 { d16\< } |
    \mBreak

    % cl 1 page 3 line 3
    \barNumberCheck #331
    c8\! c16( d es f es d) c( d c h) |
    c8 r8 r4 \repeat tremolo 4 { des16-> } |
    des8 r8 r4 r |
    r4 r des'4->~ |
    des8\> b,16(\! c des es des c) b(\> des e b') |
    \bar "||" \key f \major \tempo "Tempo I" 4 = 120
    d2.\f |
    e2( dis4 |
    \mBreak

    % cl 1 page 3 line 4
    \barNumberCheck #338
    d2.)~ |
    d4 e( dis |
    d2)\cresc e4( |
    dis4) d2 |
    e8( dis) d2->\ff\>~ |
    d2.\pp
    \mark #15
    R2.*2 |
    % Transposition: Actually gis,,, gis
    as,,2.\p->~ |
    as2.
    R2.*2 |
    b2.\p\sic->~ | % SIC: clarinet 2 and score have another p here
    b2. |
    e2.\mf |
    h2.
    \mBreak
    
    % cl 1 page 3 line 5
    \barNumberCheck #354
    f''16\f( g f es) es( f es d) d( es f g) |
    as16( b as g) g( as g f) f( g f es) |
    f8 r8 r4 r |
    R2. |
    \bar "||"
    \mark #16
    d'8\sf r8 r4 r |
    r4 r d\ff |
    d8 r8 r4 r |
    \mBreak
    
    % cl 1 page 3 line 6
    \barNumberCheck #361
    r4 r d |
    d8\sf r8 r4 r |
    r4 r a16\mf\< h a g |
    a8\sf r8 r4 r |
    r4 r h16\mf\< a h c |
    c2.->\ff |
    h2.\> |
    d16\f e d cis c d c h h c h a |
    \mBreak
    
    % cl 1 page 3 line 7
    \barNumberCheck #369
    a16 h a g g\> a g f f g f e |
    d8\! r8 r4 r |
    h'8.-.\mp\< h16-. h8-. h8-. h8-. h8-. |
    d8\! r8 r4\cresc r |
    h8.-. h16-. \repeat tremolo 4 { h8-. } |
    \mark #17
    d8\sf d\fff f\pesante f f g,16( d) |
    f8 r8 r4 r |
    \mBreak
    
    % cl 1 page 3 line 8
    \barNumberCheck #376
    r8 f'\pesante f f f g,16( d) |
    f8 r8 r4 r |
    r8 a\pesante g b a e16( a,) |
    d8 r8 r4 r |
    r8 a'\pesante g b a e16( a,) |
    d8 r8 r4 r |
    r4 r r8 \tuplet 3/2 { d16(\mf\< es e)\! } |
    \mBreak
    
    % cl 1 page 3 line 9
    \barNumberCheck #383
    f16( g f e d e d c b c b a) |
    g16( f es) r r4 r8 \tuplet 3/2 { g16(\< as a)\! }
    b16( c b a g a g f es f es d) |
    c8 c'(\mf b) c \acciaccatura { e } d( c16 b) |
    \mBreak
    
    % cl 1 page 3 line 10
    \barNumberCheck #387
    c8 c( b) c \acciaccatura { e } d( c16 b) |
    a8 r r \tuplet 3/2 { e'16(\f f fis) } g8->( e) |
    a8-> r r \tuplet 3/2 { e16( f fis) } g8->( e) |
    a8 r8 r4 r |
    r4 b8 r h r |
    \mark #18 
    c8\sf\sic %{ SIC: clarinet 2 and score have sf here %} r8 r4 r |
    r4 r f,16(\< g f g)\! |
    \mBreak
    
    % cl 1 page 3 line 11
    \barNumberCheck #394
    a8 r8 r4 r |
    r4 r f16( g a b) |
    a2.(\>\sic | % SIC: Looks like an accent in clarinet 1 but is a decrescendo in clarinet 2 and score
    f2\mf a4) |
    a2.~ |
    a2. |
    b2.~ |
    b2. |
    a4.( c8 d4)~ |
    d2.\< |
    es2.(\! |
    d2.) |
    cis2.( |
    d4\>) (a2)\! |
    \mBreak
    
    % cl 1 page 3 line 12
    \barNumberCheck #408
    des2.( |
    as2 f4) |
    b4.( c8 des4~ |
    des4\>) c2 |
    \mark #19
    a8-.\mf a16-. a16-. \repeat unfold 2 { a8-. a16-. a16-. } |
    \repeat unfold 3 { a8-. a16-. a16-. } |
    \repeat unfold 3 { c8-. c16-. c16-. } |
    \repeat unfold 2 { c8-. c16-. c16-. } b8-. b16-. b16-. |
    \mBreak

    % cl 1 page 3 line 13
    \barNumberCheck #416
    % SIC: clarinet 2 and score only have staccato for the preceding 4 bars
    a8\sic a16 a16 \repeat unfold 2 { a8 a16 a16 } |
    \repeat unfold 3 { a8 a16 a16 } |
    \repeat unfold 3 { c8 c16 c16 } |
    \repeat unfold 2 { c8 c16 c16 } b8 b16 b16 |
    \repeat unfold 3 { a8 a16 a16 } |
    \mBreak
    
    % cl 1 page 3 line 14
    \barNumberCheck #421
    \repeat unfold 3 { a8 a16 a16 } |
    a8 a16 a16 as8 as16 as16 a8 a16 a16 |
    \repeat unfold 3 { as8 as16 as16 } |
    ges8 r8 r4 r |
    r4 r8 ges16\p\< ges b8 ges16 ges\! |
    as8 r8 r4 r |
    R2.*2 |
    \mBreak
    
    % cl 1 page 4 line 1
    \barNumberCheck #429
    r4 r8 ges16 ges b8 ges16 ges |
    as8 c16 c as8 c16 c as8\< f16 f |
    e8\f e16 e e8 e16 e e8(\> f8) |
    as8\mf c16 c as8 c16 c as8\< f16 f |
    e8\f e16 e e8 e16 e e8(\> f8) |
    \mBreak

    % cl 1 page 4 line 2
    \barNumberCheck #434
    as8\mf as16 as as8 as16 as as8 as16 as |
    as8 as16 as as8\> as16 as as8\! r8 |
    \mark #20
    R2.*14 |
    % SIC: clarinet 2 and score have staccato here
    \tuplet 3/2 { f,8-.\sic\p\cresc f-. f-. } \tuplet 3/2 { \repeat tremolo 3 f8-\tongue #3 } \tuplet 3/2 { \repeat tremolo 3 f8-\tongue #3 } |
    \repeat unfold 3 \tuplet 3/2 { \repeat tremolo 3 f8-\tongue #3 } |
    \mark #21
    des''8\sf b8\ff b\pesante b b r8 |
    R2. |
    \mBreak
    
    % cl 1 page 4 line 3
    \barNumberCheck #454
    des8\sf b8\pesante b b b r8 |
    R2. |
    des8\sf r8\pocoAnimato r4 r4 |
    r8 g,16(\f\< a) b( c b a) a( b a g)\! |
    f16( g f es) g8 r8 r4 |
    r8 g16(\f\< a) b( c b a) a( b a g)\! |
    \mBreak
    
    % cl 1 page 4 line 4
    \barNumberCheck #460
    b8 g16(\cresc a) b( c b a) a( b a g) |
    b8 g16( a) b( c b a) g( b c des) |
    es8\fff b16-. b-. es8 b8 es,8 b16-. b-. |
    es8 b es, b16 b es8 b |
    r4 es''8\sf r8\lunga r4\fermata |
    \bar "||" \time 4/4 
    \mBreak
  }
}

% Transposition: Separate section so that we can apply \naturalizeMusic
clarinet_I_in_A_part_three_Music = {
  \relative c' {
    \transposition a
    % Transposition: Actually f major (465-474)
    \key des \major

    % cl 1 page 4 line 5
    \barNumberCheck #465
    \tempo "Tempo del comincio"
    R1*2 |
    R1*2\moltoRit |
    \mark #22
    R1*2 | % FIXME: Had to move the \pocoAPocoPiuAnimato, actually belongs after V?
    r4 \pocoAPocoPiuAnimato g'4\p\<~ g2\! |
    g4( ges f a\> |
    d8)\! r8 r4 \tuplet 3/2 { h'8(\< c cis } \tuplet 3/2 { d dis e)\! } |
    % SIC: clarinet 2 and score have mf here
    f8 r8 r4 \tuplet 3/2 { h,8(\mf\sic\< c cis } \tuplet 3/2 { d e eis)\! } |
    % Transposition: Actually d major (475-end)
    \bar "||"
    \mBreak

    % cl 1 page 4 line 6
    \barNumberCheck #475
    \tempo "Andante mosso" 4 = 100
    fis8 r8 r4 r2 |
    \tuplet 3/2 { h,8(\f c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis a ais\!) } |
    h8 r8 r4 r2 |
    R1*2
    \mBreak
    
    % cl 1 page 4 line 7
    \barNumberCheck #482
    \tuplet 3/2 { h8( c cis } \tuplet 3/2 { d dis e } \tuplet 3/2 { eis,\< fis g } \tuplet 3/2 { gis ais h\!) } |
    \mark #23
    a16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) }
    \mBreak
    
    % cl 1 page 4 line 8
    \barNumberCheck #485
    c16( d, dis e eis fis g gis a ais h c cis d) r8 |
    r2 \tuplet 3/2 { d8( cis c } \tuplet 3/2 { h ais h) } |
    d16( g, gis a ais h c cis d) r16 r8 r4 |
    \mBreak
    
    % cl 1 page 4 line 9
    \barNumberCheck #488
    r4 d16( dis e f) \tuplet 3/2 { e8( dis d } \tuplet 3/2 { cis c h) } |
    as16( f g as a b h c cis d) r8 r4 |
    r4 r16 d( dis e) \tuplet 3/2 { f8( cis d } \tuplet 3/2 { dis e f) } |
    \mBreak

    % cl 1 page 4 line 10
    \barNumberCheck #491
    \mark 24
    \tuplet 3/2 { g8( fis f } \tuplet 3/2 { e es d) } \tuplet 3/2 { f( e es } \tuplet 3/2 { d cis d)} |
    \tuplet 3/2 { b8( c cis } \tuplet 3/2 { d dis e) } \tuplet 3/2 { f( f, fis } \tuplet 3/2 { g gis a) } |
    \tuplet 3/2 { b8( d cis } \tuplet 3/2 { c h b) } \tuplet 3/2 { a( e' d } \tuplet 3/2 { cis c b) } |
    \mBreak
    
    % cl 1 page 4 line 11
    \barNumberCheck #494
    \tuplet 3/2 { f'8( e es } \tuplet 3/2 { d c b) } \tuplet 3/2 { d( cis c } \tuplet 3/2 { h ais a) } |
    d1->\cresc\string~ |
    d1 |
    d1~ |
    d1 |
    \mark #25
    \tempo "Allegro molto"
    fis,16(\fff d \repeat unfold 6 { fis d } fis d) |
    \mBreak
    
    % cl 1 page 4 line 12
    \barNumberCheck #500
    a'16( f \repeat unfold 6 { a16 f } g d) |
    fis16( d \repeat unfold 6 { fis d } fis d) |
    a'16( f \repeat unfold 6 { a f } g d) |
    \mBreak
    
    % cl 1 page 4 line 13
    \barNumberCheck #503
    fis16(\legato d \repeat unfold 6 { fis d } fis d) |
    \repeat tremolo 4 { fis16( d } \repeat tremolo 4 { fis16 d) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    fis8\sf r8 r4 r2 |
    \bar "|."
    \barNumberCheck #508
  }
}


clarinet_II_in_A_part_one_Music = {
  \relative c' {
    \transposition a
    \key f \major
    \numericTimeSignature
    \time 4/4
    \tempo "Andante" 4 = 72

    % cl 2 page 1 line 1
    \barNumberCheck #1
    R1*13 |
    c1->\f\>~ |
    c1~ |
    c1~ |
    c2( h4 a)\ppp  |
    R1*4 |
    \mark #1
    R1*13
    g1->\mf\>~ |
    g1~ |
    g2\pp r2 |
    R1*5 |
    \mBreak
    
    % cl 2 page 1 line 2
    \barNumberCheck #43
    \mark #2
    R1*3 |
    g'1~ |
    g1 |
    R1*2 |
    es'1(\f |
    d4) r4 r2 |
    % Transposition: Actually gis
    r4 as'~\f \tuplet 3/2 { as8 as\> as } \tuplet 3/2 { as8 as as\! } |
    g2 g2 \> |
    d2\p\< f |
    es1->\f\> |
    \mBreak

    % cl 2 page 1 line 3
    \barNumberCheck #56
    \bar "||" \time 3/4 \tempo "Allegro con brio" 4 = 120
    d8\p r8 r4 r4 |
    R2. |
    r8 a16\f( h) c d c h a h a g |
    a8-. a16( h) c d c h a h a g |
    a8-. r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    \mBreak

    % cl 2 page 1 line 4
    \barNumberCheck #62
    d8-.\sf\sic a16( h) c d c h a h a g |
    a8 a16( h) c d c h a h a g |
    a8 r r a16( h) c d c h |
    a16 h a c h\< c h c h c h c |
    \mBreak
    
    % cl 2 page 1 line 5
    \barNumberCheck #66
    c8\sf r8 r4 r4 |
    R2.*7
    \mark #3
    a8\f r b,16 c d es f g a b |
    a16( b) c8~ c b16 a g( f) d8 |
    r4 c'' b |
    a4\< b2\! |
    a4\< b2\! |
    f8 c-. b c d( c16 b) |
    \mBreak

    % cl 2 page 1 line 6
    \barNumberCheck #80
    a8-. a-. g a b( a16 g) |
    f8 r r4 r |
    r4 r es'\< |
    f8\! r8 r4 r4 |
    r4 r f16(\< g f g) |
    a8\sf r8 r4 r |
    r4 r a,16(\< h a g)\! |
    a8 r8 r4 r |
    \mBreak
    
    % cl 2 page 1 line 7
    \barNumberCheck #88
    r4 r h16(\< a h c) |
    a'2.\ff\>~ |
    a8\! r8 r4 r |
    c,2.(\f\> |
    h8)\! r8 r4 r |
    R2.*3 |
    d8.\mf\< d16 d8-. d-. d-. d-. |
    \mark #4
    d8\sf r16 f\ff f8\pesante f f4 |
    f8 g,16( d f8) r8 r4 |
    \mBreak
    
    % cl 2 page 1 line 8
    \barNumberCheck #99
    r8. f'16\pesante f8 f f4 |
    f8 g,16( d f8) r8 r4 |
    r8. a'16\pesante g8 a b4 |
    a8 e,16( a, d8) r8 r4 
    r8. a''16\pesante g8 a b4 |
    a8 e16( a, d8) r8 r4 |
    R2.*4
    \mBreak
    
    % cl 2 page 1 line 9
    \barNumberCheck #109
    r4 r4 g,\mf |
    f8 r8 r4 g |
    fis8 r8 r4 f'4-> |
    fis8 r8 r4 f-> |
    fis8 r8 r4 r |
    r4 es8\f\< r es\! r |
    es8\sf g16\mf g g8 g16 g g8 g16 g |
    g8 g16 g g8 g16 g g8\< g16 g |
    \mBreak
    
    % cl 2 page 1 line 10
    \barNumberCheck #117
    f8 f16 f f8 f16 f f8 f16 f\! |
    e8 e16 e e8 e16 e e8 e16 e |
    e8 r8 r4 r |
    R2.*5 |
    a8\mf a16 a fis8\< fis16 fis fis8 fis16 fis |
    \mark #5
    % Transposition: Actually gis
    as8\sf r8 r4 r4 |
    R2.*3 |
    R2.*6\pocoRit |
    \mBreak
  }
}

clarinet_II_in_B_Music = {
  \relative c' {

    % cl 2 page 1 line 11
    \barNumberCheck #136
    \bar "||"
    \tempo "Allegro moderato" 4 = 100
    \key c \major
    c'2.\pp~ |
    c2.( |
    e,2.)~ |
    e2.~ |
    e2.~ |
    e2. |
    f2.~ |
    f2.( |
    e4) r4 r4 |
    R2. |
    b'2.(\mf |
    a2.)( |
    e2.)~ |
    e2.\> |
    f2(\! e4 |
    \mBreak
    
    % cl 2 page 1 line 12
    \barNumberCheck #151
    es2.) |
    d2.~\> d2.( |
    \mark #6
    e8)\! r8 r4 r4 |
    R2. |
    es'4\pp( g es\> |
    g4 es f)\! |
    R2.*2 |
    es4( g f\> |
    g4 es f)\! |
    R2.*2 |
    e?4( c e |
    c4\> e c)\! |
    R2.*4 |
    \mBreak

    % cl 2 page 2 line 1
    \barNumberCheck #170
    f,2.~ |
    f2.(\<( |
    es8)\! r8 r4 r4 |

    f'4(\mf as,8 f') f4(\> |
    es8) r8\! r4 r |
    f4( as,8 f') f4(\> |
    es8) r8\! r4 r |
    R2. |
    \mark #7
    R2.*8 |
    \mBreak

    % cl 2 page 2 line 2
    \barNumberCheck #186
    r4 as,8(\p es) as( d,) |
    R2. |
    c'2(\p h4 |
    b2 a4 |
    as2 g4 |
    fis2 f4) |
    e2( dis4 |
    d2. |
    c4. h8 a4~ |
    a2.) |
    \mBreak

    % cl 2 page 2 line 3
    \barNumberCheck #196
    des'2(\mf c4 |
    h2 b4 |
    a2 as4\> |
    g2 fis4)\! |
    f2( e4 |
    es2 d 4 |
    des2 c4 |
    h2.) |
    \mark #8
    c4(\p a c |
    a\< c a)\! |
    g4( c g |
    c g\> c)\! |
    \mBreak

    % cl 2 page 2 line 4
    \barNumberCheck #208
    c4(\p\sic a c |
    a c a) |
    g4( c\< g\! |
    c g\< c)\! |
    b2.\cresc~ |
    b2. |
    des2. |
    as''2( e4) |
    c8(\f g) c( a) c( g) |
    c8(\> a) c( g) c( a) |
    c8(\mf g) c( a) c( g) |
    \mBreak
    
    % cl 2 page 2 line 5
    \barNumberCheck #219
    c8(\> a) c( g) c( a)\! |
    R2.*2 |
    \bar "||" \tempo "Allegro con brio (come prima)"
    R2.*8 |
    c,4(\p f2) |
    c4( f2) |
    c4( des4) es |
    c4( des4) es8( c8) |
    c8 r8 r4 r |
    R2.*6 |
    \mBreak
    
    % cl 2 page 2 line 6 (start)
    \barNumberCheck #241
    \mark #9
    g'4(\p c2)
    g4( c2)
    g4( a) g |
    g4( a) g8( gis) |
    e8 r8 r4 r |
    R2.*8 |
    <<
      {
       \override MultiMeasureRest.staff-position = #-4
        R2.*2
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \cueClef "bass" \stemUp des,8^"Bassi" h e4 h | des8 h e4 h | \cueClefUnset
      }
    >>
  }
}

clarinet_II_in_A_part_two_Music = {
  \relative c' {
    \transposition a
    % Transposition: Actually c major (256-294) Clarinet changes, written key doesn't
    \key g \major

    % cl 2 page 2 line 6 (continued)
    r4 a''8(\f fis) h d |
    cis8 h a( fis) h d |
    \mBreak

    % cl 2 page 2 line 7
    \barNumberCheck #258
    cis8 h a( fis) h4 |
    fis4 a8( fis) h4 |
    fis4-> a-> fis-> |
    h8-> r8 r4 r |
    \mark #11
    c4\ff c c8-. c-. |
    c4 c c8-. c-. |
    b8 r8 r4 r4 |
    R2. |
    % Transposition: Actually cis, ais dis
    des,8(\ff b) es( fis?) e-. dis-. |
    \mBreak
    
    % cl 2 page 2 line 8
    \barNumberCheck #267
    % Transposition: Actually cis ais dis
    des8( b) es( fis?) e-. dis-. |
    des8 r8 r4 r4 |
    R2. |
    a'8(\ff fis) h( d) c-. h-. |
    a8( fis) h( d) c-. h-. |
    a8( fis) h( fis) a( fis) |
    h8(\< fis) a( fis) h( fis) |
    \mBreak

    % cl 2 page 2 line 9
    \barNumberCheck #274
    g8\sf\! r8 r4 r |
    R2.*3 |
    g,2.\mf\startTrillSpan~ |
    g2~ g8\stopTrillSpan \tuplet 6/4 { g32( a h c d e } |
    f2.)\startTrillSpan~ |
    f2\<~ f8\stopTrillSpan \tuplet 6/4 { es32( f g a b c } |
    \mark #12
    d8\!) r8 \pitchedTrill d,,2\f\startTrillSpan~ e |
    d2~ d8\stopTrillSpan \tuplet 6/4 { d32_( e fis g a h } |
    \mBreak
    
    % cl 2 page 2 line 10
    \barNumberCheck #284
    c2.)\startTrillSpan~ |
    c2\stopTrillSpan\< c32( d e fis g a h c)\! |
    a8( fis) h( d) c-. h-. |
    a8( fis) e( g) fis( a) |
    g( e) a( c) h-. a-. |
    g8( e) c(\< d) e-. g-. |
    \mBreak

    % cl 2 page 2 line 11
    \barNumberCheck #290
    a8.\ff a16 a4~ a8 d,8\f |
    d8. d16 d4\>~ d8\! r8 |
    r4 r4 r8 b,\mf |
    b8. b16 b4\>~ b8\! r8 |
    R2. |
    % Transposition: Actually a major (295-321)
    \bar "||" % (already) \key g \major
    R2.*4 |
    fis'8.\mf fis16 fis2->~ |
    fis16 d( e fis) a\sic %{ SIC: No accent in 1st clarinet or score %} ( fis e fis) e( d h d) |
    \mBreak

    % cl 2 page 2 line 12
    \barNumberCheck #301
    d8. d16 d4. e8 |
    a,8.\< a16 a4. fis'8\! |
    fis8. fis16 fis4~ fis8 a\f |
    a8. a16 a4.\< fis'8\! |
    fis8. fis16 fis4~ fis8 fis\ff |
    \mark #13
    fis8. fis16 fis2\> |
    R2.\pp\pocoRit |
    \tempo "Meno mosso"
    R2.*9 |
    \mBreak
    
    % cl 2 page 2 line 13
    \barNumberCheck #317
    % Transposition: Actually dis
    d2->\mf(~ d8\> es)\! |
    R2.*2 |
    h2 e?4->(\( |
    dis4) c2\)\! |
    % Transposition: Actually c major (322-335)
    \bar "||" \key as \major
    \mark #14
    \repeat tremolo 12 { b16\mf \pocoAnimato } |
    b8 b16( c des es des c) b( c des es) |
    \repeat tremolo 12 { b16 } |
    b8 b16( c des es des c) b( c des) r16 |
    \mBreak
    
    % cl 2 page 3 line 1
    \barNumberCheck #326
    \repeat tremolo 12 { c16 } |
    c8 c16( d es f es d) c( d es f) |
    \repeat tremolo 12 { c16 } |
    c8 c16( d es f es d) c( cis d es) |
    \repeat tremolo 12 { b16\< } |
    c8\! c16( d es f es d) c( d c h) |
    \mBreak
    
    % cl 2 page 3 line 2
    \barNumberCheck #332
    c8 r8 r4 \repeat tremolo 4 { des16-> } |
    b8 r8 r4 r |
    r4 r as'4->( |
    g8)\> b,16(\! c des es des c) b(\> d e\! r16) |
    \bar "||" \key f \major \tempo "Tempo I" 4 = 120
    d2.\f |
    e2( dis4 |
    d2.)~ |
    d4 e( dis |
    d2)\cresc e4( |
    \mBreak

    % cl 2 page 3 line 3
    \barNumberCheck #341
    dis4) d2 |
    e8( dis) d2->\ff\>~ |
    d2.\pp
    \mark #15
    R2.*2 |
    % Transposition: Actually gis,, gis
    as,2.->\p~ |
    as2.
    R2.*2 |
    as2.->\p~ |
    as2. |
    e'2.\mf |
    h2.
    d'16\f( es d c) c( d c b) b( c d es) |
    \mBreak

    % cl 2 page 3 line 4
    \barNumberCheck #355
    f16( g f es) es( f es d) d( es d c) |
    d8 r8 r4 r |
    R2. |
    \bar "||"
    \mark #16
    d'8\sf r8 r4 r |
    r4 r d,16(\ff e d e |
    f8) r8 r4 r |
    r4 r d16( e f g |
    a8)\sf r8 r4 r |
    \mBreak
    
    % cl 2 page 3 line 5
    \barNumberCheck #363
    r4 r a16\mf\< h a g |
    a8\sf r8 r4 r |
    r4 r h16\mf\< a h c |
    a2.->\ff |
    a2.\> |
    d,16\f e d cis c d c h h c h a |
    a16 h a g g\> a g f f g f e |
    \mBreak
    
    % cl 2 page 3 line 6
    \barNumberCheck #370
    d8\! r8 r4 r |
    R2. |
    a''8.-.\cresc a16-. a8-. a8-. a8-. a8-. |
    a8.-. a16-. a8-. a8-. a8-. a8-. |
    \mark #17
    a8\sf a\fff g\pesante h a g16( d) |
    f8 r8 r4 r |
    r8 a g\pesante h a g16( d) |
    \mBreak
    
    % cl 2 page 3 line 7
    \barNumberCheck #377
    f8 r8 r4 r |
    r8 f e\pesante g f e16( a,) |
    d8 r8 r4 r |
    r8 f e\pesante g f e16( a,) |
    d8 r8 r4 r |
    r4 r r8 \tuplet 3/2 { d16(\mf\< es e)\! } |
    f16( g f e d e d c b c b a) |
    \mBreak
    
    % cl 2 page 3 line 8
    \barNumberCheck #384
    g16( f es) r r4 r8 \tuplet 3/2 { g16(\< as a)\! }
    b16( c b a g a g f es f es d) |
    c8 c'(\mf b) c \acciaccatura { e } d( c16 b) |
    c8 c( b) c \acciaccatura { e } d( c16 b) |
    a8 r r \tuplet 3/2 { e16\f f fis } g8->( e) |
    \mBreak
    
    % cl 2 page 3 line 9
    \barNumberCheck #389
    a8-> r r \tuplet 3/2 { e16 f fis } g8->( e) |
    a8 r8 r4 r |
    r4 f'8 r as r |
    \mark #18 
    a8\sf r8 r4 r |
    r4 r f,16(\< g f g)\! |
    a8 r8 r4 r |
    r4 r f16( g a b) |
    c2.\>~ |
    c2.\mf |
    \mBreak
    
    % cl 2 page 3 line 10
    \barNumberCheck #398
    cis2.( |
    d2)( f4) |
    d2.(~ |
    d2 f4) |
    f2.( |
    a2\< f4)\! |
    fis2.(~ |
    fis4 g b) |
    f2.(~ |
    f4\> d f)\! |
    f2.(~ |
    f2 des4) |
    f2.( |
    e2.)\> |
    \mBreak
    
    % cl 2 page 3 line 11
    \barNumberCheck #412
    \mark #19
    % SIC: Not solo in clarinet 1 and score
    f8-.\mf\sic f16-. f16-. \repeat unfold 2 { f8-. f16-. f16-. } |
    \repeat unfold 3 { f8-. f16-. f16-. } |
    \repeat unfold 3 { as8-. as16-. as16-. } |
    \repeat unfold 2 { as8-. as16-. as16-. } f8-. f16-. f16-. |
    \repeat unfold 3 { f8 f16 f16 } |
    \mBreak

    % cl 2 page 3 line 12
    \barNumberCheck #417
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { as8 as16 as16 } |
    \repeat unfold 2 { as8 as16 as16 } f8 f16 f16 |
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { f8 f16 f16 } |
    \mBreak

    % cl 2 page 3 line 13
    \barNumberCheck #422
    \repeat unfold 3 { f8 f16 f16 } |
    \repeat unfold 3 { f8 f16 f16 } |
    des8 r8 r4 r |
    r4 r8 b16\p\< b des8 b16 b\! |
    c8 r8 r4 r |
    R2.*2 |
    \mBreak
    
    % cl 2 page 4 line 1
    \barNumberCheck #429
    r4 r8 b16 b des8 b16 b |
    c8 f16 f c8 f16 f c8\< c16 c |
    des8\f des16 des des8 des16 des des4\> |
    c8\mf f16 f c8 f16 f c8\< c16 c |
    des8\f des16 des des8 des16 des des4\> |
    \mBreak
    
    % cl 2 page 4 line 2
    \barNumberCheck #434
    des8\mf des16 des des8 des16 des des8 des |
    des8 des16 des des8\> des16 des as8\! r8 |
    \mark #20
    R2.*14 |
    \tuplet 3/2 { des,8-.\p\cresc des-. des-. } \tuplet 3/2 { \repeat tremolo 3 des8-\tongue #3 } \tuplet 3/2 { \repeat tremolo 3 des8-\tongue #3 } |
    \repeat unfold 3 \tuplet 3/2 { \repeat tremolo 3 des8-\tongue #3 } |
    \mark #21
    f'8\sf b8\ff b\pesante b b r8 |
    R2. |
    \mBreak

    % cl 2 page 4 line 3
    \barNumberCheck #454
    f8\sf b b b b r8 |
    R2. |
    des8\sf r8\pocoAnimato r4 r4 |
    r8 g,16(\f\< a) b( c b a) a( b a g)\! |
    f16( g f es) g8 r8 r4 |
    r8 g16(\f\< a) b( c b a) a( b a g)\! |
    \mBreak

    % cl 2 page 4 line 4
    \barNumberCheck #460
    b8 g16(\cresc a) b( c b a) a( b a g) |
    b8 g16( a) b( c b a) g( b c des) |
    des8\fff g,16-. g-. c8 g des8 g,16-. g-. |
    c8 g des g,16 g c8 g |
    r4 b''8\sf r8\lunga r4\fermata |
    \bar "||" \time 4/4 
    \mBreak
  }
}

% Transposition: Separate section so that we can apply \naturalizeMusic
clarinet_II_in_A_part_three_Music = {
  \relative c' {
    \transposition a
    % Transposition: Actually f major (465-474)
    \key des \major
    
    % cl 2 page 4 line 5
    \barNumberCheck #465
    \tempo "Tempo del comincio"
    R1*2 |
    R1*2\moltoRit |
    \mark #22
    R1*2 % FIXME: Had to move the \pocoAPocoPiuAnimato, actually belongs after V?
    r4\pocoAPocoPiuAnimato d4\p\<( es2)\! |
    e2( f\> |
    f8)\! r8 r4 \tuplet 3/2 { d'8(\mf\< dis e } \tuplet 3/2 { f fis g)\! } |
    gis8 r8 r4 \tuplet 3/2 { d8(\< dis e } \tuplet 3/2 { f g gis)\! } |
    % Transposition: Actually d major (475-end)
    \bar "||"
    \mBreak

    % cl 2 page 4 line 6
    \barNumberCheck #475
    \tempo "Andante mosso" 4 = 100
    h8 r8 r4 r2 |
    \tuplet 3/2 { d,8(\f dis e } \tuplet 3/2 { eis fis g } \tuplet 3/2 { gis\< a ais } \tuplet 3/2 { h c cis\!) } |
    d8 r8 r4 r2 |
    \tuplet 3/2 { d,8( dis e } \tuplet 3/2 { eis fis g } \tuplet 3/2 { gis\< a ais } \tuplet 3/2 { h c cis\!) } |
    d8 r8 r4 r2 |
    \mBreak
    
    % cl 2 page 4 line 7
    \barNumberCheck #480
    R1*2
    \tuplet 3/2 { d,8( dis e } \tuplet 3/2 { eis fis g } \tuplet 3/2 { gis\< a ais } \tuplet 3/2 { h cis d\!) } |
    \mark #23
    c8 r r4 r r16 d,( dis e |
    eis16 fis\< g gis a ais h c\!) \tuplet 3/2 { h8( ais a } \tuplet 3/2 { gis g fis) } |
    \mBreak
    
    % cl 2 page 4 line 8
    \barNumberCheck #485
    a8 r r4 r r16 d,(\< dis e |
    eis16 fis g gis a ais h c\!) \tuplet 3/2 { h8( ais a } \tuplet 3/2 { gis g fis) } |
    f8 r 8 r4 r r16 g(\< gis a |
    ais16 h c cis) d\! r16 r8 \tuplet 3/2 { gis,( g f } \tuplet 3/2 { e dis d) } |
    \mBreak
    
    % cl 2 page 4 line 9
    \barNumberCheck #489
    f8 r r4 r f16( fis g as |
    a16\< b h c cis d)\! r8 \tuplet 3/2 { a8( e f } \tuplet 3/2 { g gis a) } |
    \mark 24
    \tuplet 3/2 { b8( a as } \tuplet 3/2 { g fis f) } \tuplet 3/2 { a( gis g } \tuplet 3/2 { f e f) } |
    \mBreak

    % cl 2 page 4 line 10
    \barNumberCheck #492
    \tuplet 3/2 { d8( es e } \tuplet 3/2 { f fis g) } \tuplet 3/2 { a( d, dis } \tuplet 3/2 { e f fis) } |
    \tuplet 3/2 { g8( b a } \tuplet 3/2 { as g fis) } \tuplet 3/2 { f( g f } \tuplet 3/2 { e es d) } |
    \tuplet 3/2 { d'8( cis c } \tuplet 3/2 { b a g) } \tuplet 3/2 { b( a as } \tuplet 3/2 { g fis f) } |
    \mBreak
    
    % cl 2 page 4 line 11
    \barNumberCheck #495
    g1->\cresc\string~ |
    g1 |
    f1~ |
    f1 |
    \mark #25
    \tempo "Allegro molto"
    fis16(\fff d \repeat unfold 6 { fis d } fis d) |
    a'16( f \repeat unfold 6 { a16 f } g d) |
    \repeat tremolo 4 { fis16( d } \repeat tremolo 4 { fis16 d) } |
    \mBreak

    % cl 2 page 4 line 12
    \barNumberCheck #502
    \repeat tremolo 4 { a'16( f } \repeat unfold 3 { a f } g d) |
    \repeat tremolo 4 { fis16(\legato d } \repeat tremolo 4 { fis16 d) } |
    \repeat tremolo 4 { fis16( d } \repeat tremolo 4 { fis16 d) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    \repeat tremolo 4 { fis16( a } \repeat tremolo 4 { fis16 a) } |
    fis8\sf r8 r4 r2 |
    \bar "|."
    \barNumberCheck #508
  }
}

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
      \new Voice {
        {
          \transpose b a
          \clarinet_I_in_A_part_one_Music
        }
        \clarinet_I_in_B_Music
        {
          \transpose b a
          \clarinet_I_in_A_part_two_Music
        }
        {
          \naturalizeMusic \transpose b a
          \clarinet_I_in_A_part_three_Music
        }
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
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          \transpose b a
          \clarinet_II_in_A_part_one_Music
        }
        \clarinet_II_in_B_Music
        {
          \transpose b a
          \clarinet_II_in_A_part_two_Music
        }
        {
          \naturalizeMusic \transpose b a
          \clarinet_II_in_A_part_three_Music
        }
      }
    }
  }
}
