import 'package:bodas/routes/linkspaper.dart';

class DynamicTextFieldRowWithValue extends ConsumerWidget {
  final StateNotifierProvider<TextFieldValueNotifier, List<String>> provider;
  final int index;
  final double height;

  const DynamicTextFieldRowWithValue({
    super.key,
    required this.provider,
    required this.index,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(provider);
    final value = values[index];
    final controller = TextEditingController(text: value);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Expanded(
        child: FormInputField(
          controller: controller,
          height: height,
          icon: index == value.length
              ? GestureDetector(
                  onTap: () {
                    ref.read(provider.notifier).addField();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                )
              : null,
          cambio: (val) => ref.read(provider.notifier).updateValue(index, val),
        ),
      ),
    );
  }
}
