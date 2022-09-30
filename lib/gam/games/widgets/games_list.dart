import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zizu/gam/games/games.dart';

class GamesList extends StatefulWidget {
  const GamesList({Key key});

  @override
  State<GamesList> createState() => _GamesListState();
}

class _GamesListState extends State<GamesList> {
  EdgeInsets _padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    final games = context.watch<List<Game>>();
    final data = MediaQuery.of(context);

    final side = data.size.width * 0.5;
    final offset = side * 0.4;
    final factor = data.size.height * 0.15;
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20) + _padding,
      separatorBuilder: (_, __) => const SizedBox.shrink(),
      itemCount: games.length + 1,
      itemBuilder: (context, i) {
        if (i == 0) {
          return const Header();
        }

        final index = i - 1;

        return Stack(
          children: [
            Squeeze(
              squeeze: 15,
              onSqueeze: (squeeze) {
                setState(() {
                  _padding = EdgeInsets.only(top: squeeze);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GameCard(game: games[index]),
              ),
            ),
            if (index.isOdd)
              IgnorePointer(
                child: Align(
                  alignment: Alignment.topRight,
                  child: ScrollOffset(
                    scrollable: Scrollable.of(context),
                    factor: factor,
                    initialOffset: Offset(
                      Alignment.topRight.x < Alignment.center.x
                          ? -offset
                          : offset,
                      0,
                    ),
                    child: SizedBox(
                      height: side,
                      width: side,
                      child: Image.asset(
                        'assets/symbols/symbols_2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              )
            else
              IgnorePointer(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ScrollOffset(
                    scrollable: Scrollable.of(context),
                    factor: factor,
                    initialOffset: Offset(
                      Alignment.topLeft.x < Alignment.center.x
                          ? -offset
                          : offset,
                      0,
                    ),
                    child: SizedBox(
                      height: side,
                      width: side,
                      child: Image.asset(
                        'assets/symbols/symbols_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
