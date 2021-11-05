import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta/theta.dart';
import 'package:thetaf/src/model/response_notifier.dart';

/// label: 'new label',
/// example `label: 'DELETE EVERYTHING',`
class DeleteAllFilesButton extends StatelessWidget {
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final String label;

  const DeleteAllFilesButton({
    Key? key,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.label = 'DELETE ALL',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        //TODO: This button works great now but needs to be tested more
        onPressed: () async {
          var response = await command('delete', parameters: {
            'fileUrls': ['all']
          });
          Provider.of<ResponseNotifier>(context, listen: false)
              .setResponseText(response);
        },
        child: Text(label));
  }
}
