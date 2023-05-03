import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(
          noticia: news[index],
          index: index,
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article noticia;
  final int index;

  const _News({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(noticia, index),
        _CardTitle(noticia),
        _CardImage(noticia),
        _CardDescription(noticia),
        _CardButtons(),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 5,
          color: Colors.black,
        )
      ],
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.indigo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  final Article noticia;

  const _CardDescription(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text((noticia.description != null) ? noticia.description! : ''));
  }
}

class _CardImage extends StatelessWidget {
  final Article noticia;

  const _CardImage(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        child: Container(
          child: (noticia.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(noticia.urlToImage!))
              : const Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article noticia;

  const _CardTitle(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        noticia.title!,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _CardTopBar(this.noticia, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            "${index + 1}. ",
            style: TextStyle(fontSize: 16, color: myTheme.accentColor),
          ),
          Text(
            "${noticia.source!.name}. ",
          ),
        ],
      ),
    );
  }
}
