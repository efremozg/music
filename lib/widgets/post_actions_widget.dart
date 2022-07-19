import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/constants.dart';
import 'package:flutter_music/data/user_data.dart';
import 'package:flutter_music/models/favotite_page_models.dart';
import 'package:flutter_music/widgets/posts_widget.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import '../models/favorite_list_models.dart';

class PostActionsWidget extends StatefulWidget {
  PostActionsWidget(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  State<PostActionsWidget> createState() => _PostActionsWidgetState();
}

class _PostActionsWidgetState extends State<PostActionsWidget> {
  final bool isLiked = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    void openbottommenu() {
      setState(() {
        showFlexibleBottomSheet(
          minHeight: 0,
          initHeight: 0.2,
          maxHeight: 0.75,
          context: context,
          builder: _buildBottomSheet,
          anchors: [0, 0.75],
          isSafeArea: false,
        );
        return;
      });
    }

    var item = context.select<FavoriteListModel, Item>(
      (favoritelist) => favoritelist.getByPosition(widget.index),
    );

    {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AddButton(item: item),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 1),
          child: ElevatedButton(
            onPressed: (() {
              setState(() {
                openbottommenu();
              });
            }),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(40, 34)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 73, 189, 102)),
            ),
            child: const Text('Купить'),
          ),
        ),
      ]);
    }
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return StatefulBuilder(builder: ((context, StateSetter setModalState) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: foregroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            controller: scrollController,
            children: [
              const Text(
                'Выберите тариф',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              LeasingChoice(widget.index),
              const SizedBox(height: 8),
              ExclusiveChoice(widget.index),
              const SizedBox(height: 8),
              InfoBeatWarning(),
              const SizedBox(height: 15),
              DocumentChoice(),
              const SizedBox(height: 15),
              MailProductSend(),
              const SizedBox(height: 20),
              BuyButton()
            ],
          ),
        ),
      );
    }));
  }
}

class BuyButton extends StatefulWidget {
  const BuyButton({Key? key}) : super(key: key);

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 73, 189, 102)),
          child: const Center(
            child: Text(
              'Перейти к оплате',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}

class LeasingChoice extends StatefulWidget {
  final int index;
  const LeasingChoice(this.index, {Key? key}) : super(key: key);

  @override
  State<LeasingChoice> createState() => _LeasingChoiceState();
}

class _LeasingChoiceState extends State<LeasingChoice> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: beatInfo[widget.index].leasePrice.length.toDouble(),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isClicked ? Colors.grey[800] : Colors.grey[900]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Аренда - ${beatInfo[widget.index].leasePrice} рублей',
                style: mainTextStyle,
              ),
              Icon(Icons.check_circle,
                  color: isClicked
                      ? Color.fromARGB(255, 73, 189, 102)
                      : Colors.grey,
                  size: 18)
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBeatWarning extends StatelessWidget {
  const InfoBeatWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 151,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[850],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 8),
            child: Row(
              children: const [
                Icon(UniconsLine.info_circle, color: Colors.yellow, size: 22),
                SizedBox(width: 8),
                Text(
                  'Внимание',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: const [
                    Text(
                      'Тариф "Аренда" предполагает многократное использование. Несколько исполнителей могут арендовать бит',
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Тариф "Эксклюзив" продается один раз. Права остаются у битмейкера',
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExclusiveChoice extends StatefulWidget {
  final int index;
  const ExclusiveChoice(this.index, {Key? key}) : super(key: key);

  @override
  State<ExclusiveChoice> createState() => _ExclusiveChoiceState();
}

class _ExclusiveChoiceState extends State<ExclusiveChoice> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: beatInfo[widget.index].leasePrice.length.toDouble(),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isClicked ? Colors.grey[800] : Colors.grey[900]),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Эксклюзив - ${beatInfo[widget.index].exclesivePrice} рублей',
                style: mainTextStyle,
              ),
              Icon(Icons.check_circle,
                  color: isClicked
                      ? Color.fromARGB(255, 73, 189, 102)
                      : Colors.grey,
                  size: 18)
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentChoice extends StatefulWidget {
  const DocumentChoice({Key? key}) : super(key: key);

  @override
  State<DocumentChoice> createState() => _DocumentChoiceState();
}

class _DocumentChoiceState extends State<DocumentChoice> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Документы',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isClicked ? Colors.grey[800] : Colors.grey[900]),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Мне нужны документы на бит',
                    style: mainTextStyle,
                  ),
                  Icon(Icons.check_circle,
                      color: isClicked
                          ? Color.fromARGB(255, 73, 189, 102)
                          : Colors.grey,
                      size: 18)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MailProductSend extends StatefulWidget {
  const MailProductSend({Key? key}) : super(key: key);

  @override
  State<MailProductSend> createState() => _MailProductSendState();
}

class _MailProductSendState extends State<MailProductSend> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Почта для отправки бита/документов',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        TextField(
          style: const TextStyle(color: Colors.white38),
          decoration: InputDecoration(
              focusColor: Colors.white38,
              hoverColor: Colors.white38,
              suffixIconColor: Colors.grey[400],
              hintText: 'Введите почту',
              hintStyle: secondTextStyle,
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final Item item;

  const AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      splashRadius: 1,
      icon: isInFavoritePage
          ? Icon(UniconsLine.heart, color: Colors.red, size: 30)
          : Icon(UniconsLine.heart, color: Colors.white, size: 28),
      onPressed: isInFavoritePage
          ? () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.remove(item);
            }
          : () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.add(item);
            },
    );
  }
}
