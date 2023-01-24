import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SearchCallback = void Function(String text);
typedef AdditionalFilterCallback = void Function()?;

class FilterContent extends ConsumerStatefulWidget {
  @override
  _FilterContentState createState() => _FilterContentState();

  final String hintText;
  final String text;
  final SearchCallback onSearch;
  final AdditionalFilterCallback onAdditionalFilter;
  const FilterContent(
    this.text, {
    super.key,
    this.hintText = "Search",
    required this.onSearch,
    this.onAdditionalFilter,
  });
}

class _FilterContentState extends ConsumerState<FilterContent> with SingleTickerProviderStateMixin {
  bool searching = false;
  late TextEditingController _textEditingController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthMax = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: AnimatedContainer(
                  height: 35,
                  duration: const Duration(milliseconds: 300),
                  width: widget.onAdditionalFilter != null ? widthMax * .9 - 10 : widthMax - 10,
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    controller: _textEditingController,
                    autocorrect: false,
                    onTap: () {
                      setState(() {
                        searching = true;
                        _animationController.forward();
                      });
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (value) {
                      widget.onSearch(value);
                    },
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: widget.hintText,
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.onSearch("");
                            searching = false;
                            _textEditingController.text = "";
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: Icon(
                          Icons.clear,
                          size: _textEditingController.text.isNotEmpty ? 16 : 0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(width: 0, color: Theme.of(context).cardColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(width: 0, color: Theme.of(context).cardColor),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.onAdditionalFilter != null)
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    widget.onAdditionalFilter!();
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
