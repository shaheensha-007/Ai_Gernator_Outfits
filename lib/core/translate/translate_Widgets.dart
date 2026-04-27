import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../../controllers/main_contollers/Lanuage_Controller.dart';

enum TTextType {
  text,
  selectableText,
  richText,
  textFieldHint,
  textFieldLabel,
}

class TText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? align;
  final TTextType type;
  final List<InlineSpan>? spans;

  const TText({
    super.key,
    required this.text,
    this.style,
    this.overflow,
    this.maxLines,
    this.align,
    this.type = TTextType.text,
    this.spans,
  });

  @override
  State<TText> createState() => _TTextState();
}

class _TTextState extends State<TText> {
  final translator = GoogleTranslator();
  final languageController = Get.find<LanguageController>();

  String translatedMain = "";
  List<InlineSpan> translatedSpans = [];
  bool loading = true;

  // Worker to properly dispose GetX listener
  Worker? _languageWorker;

  @override
  void initState() {
    super.initState();
    _translate();

    // Use Worker for proper cleanup
    _languageWorker = ever(languageController.selectedLanguage, (_) {
      if (mounted) _translate();
    });
  }

  @override
  void dispose() {
    // Cancel the GetX listener to prevent memory leaks
    _languageWorker?.dispose();
    super.dispose();
  }

  Future<void> _translate() async {
    if (!mounted) return; // Early exit if not mounted

    String lang = languageController.selectedLanguage.value;

    if (mounted) {
      setState(() => loading = true);
    }

    if (lang == "en") {
      translatedMain = widget.text;
      translatedSpans = widget.spans ?? [];
      if (mounted) {
        setState(() => loading = false);
      }
      return;
    }

    try {
      final main = await translator.translate(widget.text, from: 'en', to: lang);
      if (!mounted) return; // Check after async operation

      translatedMain = main.text;

      translatedSpans = [];
      if (widget.spans != null) {
        for (var span in widget.spans!) {
          if (!mounted) return; // Check during loop
          translatedSpans.add(await _translateSpan(span, lang));
        }
      }

      if (mounted) {
        setState(() => loading = false);
      }
    } catch (e) {
      if (!mounted) return;

      translatedMain = widget.text;
      translatedSpans = widget.spans ?? [];

      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  Future<InlineSpan> _translateSpan(InlineSpan span, String lang) async {
    if (span is TextSpan) {
      String? translatedText;
      if (span.text != null && span.text!.isNotEmpty) {
        if (!mounted) return span; // Check before async operation

        final t = await translator.translate(span.text!, from: 'en', to: lang);
        if (!mounted) return span; // Check after async operation

        translatedText = t.text;
      }

      List<InlineSpan>? translatedChildren;
      if (span.children != null) {
        translatedChildren = [];
        for (var child in span.children!) {
          if (!mounted) break;
          translatedChildren.add(await _translateSpan(child, lang));
        }
      }

      return TextSpan(
        text: translatedText,
        style: span.style,
        children: translatedChildren,
        recognizer: span.recognizer,
        semanticsLabel: span.semanticsLabel,
      );
    }
    return span;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SizedBox(
        height: 16,
        width: 16,
        child: CupertinoActivityIndicator(),
      );
    }

    switch (widget.type) {
      case TTextType.text:
        return Text(
          translatedMain,
          style: widget.style,
          overflow: widget.overflow,
          maxLines: widget.maxLines,
          textAlign: widget.align,
        );

      case TTextType.selectableText:
        return SelectableText(
          translatedMain,
          style: widget.style,
        );

      case TTextType.richText:
        return Text.rich(
          TextSpan(
            text: translatedMain,
            style: widget.style,
            children: translatedSpans,
          ),
          maxLines: widget.maxLines,
          textAlign: widget.align,
          overflow: widget.overflow,
        );

      case TTextType.textFieldHint:
      case TTextType.textFieldLabel:
        return Text(
          translatedMain,
          style: widget.style,
        );
    }
  }
}

// Custom TextFormField with translation support
class TTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<String>? autofillHints;
  final InputBorder? border;
  final bool enabled;

  const TTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.autofillHints,
    this.border,
    this.enabled = true,
  });

  @override
  State<TTextFormField> createState() => _TTextFormFieldState();
}

class _TTextFormFieldState extends State<TTextFormField> {
  final translator = GoogleTranslator();
  final languageController = Get.find<LanguageController>();

  String? translatedHint;
  String? translatedLabel;

  // Worker to properly dispose GetX listener
  Worker? _languageWorker;

  @override
  void initState() {
    super.initState();
    _translate();

    // Use Worker for proper cleanup
    _languageWorker = ever(languageController.selectedLanguage, (_) {
      if (mounted) _translate();
    });
  }

  @override
  void dispose() {
    // Cancel the GetX listener to prevent memory leaks
    _languageWorker?.dispose();
    super.dispose();
  }

  Future<void> _translate() async {
    if (!mounted) return;

    String lang = languageController.selectedLanguage.value;

    if (lang == "en") {
      translatedHint = widget.hintText;
      translatedLabel = widget.labelText;
      if (mounted) setState(() {});
      return;
    }

    try {
      if (widget.hintText != null) {
        final hint = await translator.translate(widget.hintText!, from: 'en', to: lang);
        if (!mounted) return;
        translatedHint = hint.text;
      }

      if (widget.labelText != null) {
        final label = await translator.translate(widget.labelText!, from: 'en', to: lang);
        if (!mounted) return;
        translatedLabel = label.text;
      }

      if (mounted) setState(() {});
    } catch (e) {
      if (!mounted) return;

      translatedHint = widget.hintText;
      translatedLabel = widget.labelText;

      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      autofillHints: widget.autofillHints,
      enabled: widget.enabled,
      decoration: InputDecoration(
        border: widget.border,
        hintText: translatedHint,
        labelText: translatedLabel,
        hintStyle: widget.hintStyle,
        labelStyle: widget.labelStyle,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
      style: widget.style,
    );
  }
}

// Rich Text Widget with translation
class TRichText extends StatefulWidget {
  final String mainText;
  final List<RichTextSegment> segments;
  final TextStyle? baseStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const TRichText({
    super.key,
    this.mainText = '',
    required this.segments,
    this.baseStyle,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  @override
  State<TRichText> createState() => _TRichTextState();
}

class RichTextSegment {
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;

  RichTextSegment({required this.text, this.style, this.onTap});
}

class _TRichTextState extends State<TRichText> {
  final translator = GoogleTranslator();
  final languageController = Get.find<LanguageController>();

  String translatedMain = "";
  List<TextSpan> translatedSpans = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _translate();

    ever(languageController.selectedLanguage, (_) {
      if (mounted) _translate();
    });
  }

  Future<void> _translate() async {
    String lang = languageController.selectedLanguage.value;

    setState(() => loading = true);

    if (lang == "en") {
      translatedMain = widget.mainText;
      translatedSpans = widget.segments
          .map((seg) => TextSpan(text: seg.text, style: seg.style))
          .toList();
      setState(() => loading = false);
      return;
    }

    try {
      if (widget.mainText.isNotEmpty) {
        final main = await translator.translate(widget.mainText, from: 'en', to: lang);
        translatedMain = main.text;
      }

      translatedSpans = [];
      for (var segment in widget.segments) {
        final t = await translator.translate(segment.text, from: 'en', to: lang);
        translatedSpans.add(TextSpan(text: t.text, style: segment.style));
      }

      setState(() => loading = false);
    } catch (e) {
      translatedMain = widget.mainText;
      translatedSpans = widget.segments
          .map((seg) => TextSpan(text: seg.text, style: seg.style))
          .toList();
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SizedBox(
        height: 16,
        width: 16,
        child: CupertinoActivityIndicator(),
      );
    }

    // Map translated spans with their original tap handlers
    List<TextSpan> finalSpans = [];
    for (int i = 0; i < translatedSpans.length && i < widget.segments.length; i++) {
      final span = translatedSpans[i];
      final originalSegment = widget.segments[i];

      if (originalSegment.onTap != null) {
        finalSpans.add(
          TextSpan(
            text: span.text,
            style: span.style,
            recognizer: TapGestureRecognizer()..onTap = originalSegment.onTap,
          ),
        );
      } else {
        finalSpans.add(span);
      }
    }

    return RichText(
      text: TextSpan(
        text: translatedMain.isEmpty ? null : translatedMain,
        style: widget.baseStyle,
        children: finalSpans,
      ),
      maxLines: widget.maxLines,
      textAlign: widget.textAlign ?? TextAlign.start,
      overflow: widget.overflow ?? TextOverflow.clip,
    );
  }
}