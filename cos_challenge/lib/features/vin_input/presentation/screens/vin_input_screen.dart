import 'package:cos_challenge/core/exceptions/failure.dart';
import 'package:cos_challenge/core/utils/app_strings.dart';
import 'package:cos_challenge/core/utils/snackbar_utils.dart';
import 'package:cos_challenge/core/utils/vin_validator.dart';
import 'package:cos_challenge/features/auction_data/presentation/screens/auction_screen.dart';
import 'package:cos_challenge/features/vin_input/application/vin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VinInputScreen extends ConsumerStatefulWidget {
  const VinInputScreen({super.key});

  @override
  ConsumerState<VinInputScreen> createState() => _VinInputScreenState();
}

class _VinInputScreenState extends ConsumerState<VinInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vinController = TextEditingController();
  late final ProviderSubscription _vinListener;

  @override
  void initState() {
    super.initState();
    _vinListener = ref.listenManual(vinControllerProvider, (previous, next) {
      if (next is AsyncData<Map<String, dynamic>?>) {
        final data = next.value;
        if (data != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AuctionScreen(data: data)),
          );
        }
      }
      if (next is AsyncError) {
        final err = next.error;
        if (err is RedirectFailure) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VehicleSelectionScreen(options: err.options),
            ),
          );
        } else if (err is ServerFailure || err is Failure) {
          SnackBarUtils.showWarning(context, (err as Failure).message);
        }
      }
    });
  }

  @override
  void dispose() {
    _vinController.dispose();
    _vinListener.close();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final state = ref.read(vinControllerProvider);
      if (!state.isLoading) {
        ref
            .read(vinControllerProvider.notifier)
            .fetchVin(_vinController.text.trim());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vinState = ref.watch(vinControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(VinInputStrings.enterVin)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                VinInputStrings.vinPrompt,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _vinController,
                decoration: const InputDecoration(
                  labelText: VinInputStrings.vinHint,
                  errorMaxLines: 4,
                ),
                validator: VinValidator.validate,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child:
                    vinState.isLoading
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : const Text(VinInputStrings.vinSubmit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
