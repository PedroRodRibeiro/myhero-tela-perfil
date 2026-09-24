import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  static const Color _accentColor = Color(0xFFFF0052);
  static const Color _availableColor = Color(0xFF8BC34A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 32),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _accentColor.withValues(alpha: 0.10),
                    border: Border.all(
                      color: _accentColor,
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 90,
                    color: _accentColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pedro Henrique',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Usuário MyHero',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: _availableColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Perfil ativo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _ProfileOption(
                icon: Icons.person_outline,
                title: 'Dados pessoais',
                subtitle: 'Visualize suas informações',
                onTap: () => _showMessage(context, 'Dados pessoais'),
              ),
              const Divider(),
              _ProfileOption(
                icon: Icons.favorite_border,
                title: 'Heróis favoritos',
                subtitle: 'Veja os heróis que você mais gosta',
                onTap: () => _showMessage(context, 'Heróis favoritos'),
              ),
              const Divider(),
              _ProfileOption(
                icon: Icons.notifications_none,
                title: 'Notificações',
                subtitle: 'Gerencie suas notificações',
                onTap: () => _showMessage(context, 'Notificações'),
              ),
              const Divider(),
              _ProfileOption(
                icon: Icons.settings_outlined,
                title: 'Configurações',
                subtitle: 'Preferências do aplicativo',
                onTap: () => _showMessage(context, 'Configurações'),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 230,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(_accentColor),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'VOLTAR',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showMessage(BuildContext context, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$item selecionado'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const SizedBox(width: 4),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: UserProfile._accentColor.withValues(alpha: 0.10),
              ),
              child: Icon(
                icon,
                color: UserProfile._accentColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: UserProfile._accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
