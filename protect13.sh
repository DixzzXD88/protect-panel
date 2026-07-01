#!/bin/bash

REMOTE_PATH="/var/www/pterodactyl/app/Http/Controllers/Admin/ApiController.php"
TIMESTAMP=$(date -u +"%Y-%m-%d-%H-%M-%S")
BACKUP_PATH="${REMOTE_PATH}.bak_${TIMESTAMP}"

echo "🚀 Memasang proteksi Anti Bikin PTLA (FINAL)..."

# Backup file asli
if [ -f "$REMOTE_PATH" ]; then
  cp "$REMOTE_PATH" "$BACKUP_PATH"
  echo "📦 Backup file lama dibuat di $BACKUP_PATH"
fi

# Tulis file baru dengan proteksi
cat > "$REMOTE_PATH" << 'EOF'
<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Illuminate\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Pterodactyl\Models\ApiKey;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Prologue\Alerts\AlertsMessageBag;
use Pterodactyl\Services\Acl\Api\AdminAcl;
use Pterodactyl\Http\Controllers\Controller;
use Pterodactyl\Services\Api\KeyCreationService;
use Pterodactyl\Http\Requests\Admin\Api\StoreApplicationApiKeyRequest;

class ApiController extends Controller
{
    /**
     * ApiController constructor.
     */
    public function __construct(
        private AlertsMessageBag $alert,
        private KeyCreationService $keyCreationService,
    ) {
    }

    /**
     * Render view showing all of a user's application API keys.
     */
    public function index(Request $request): View
    {
        // 🔒 PROTEKSI: Cuma admin ID 1 yang bisa akses
        if (Auth::user()->id !== 1) {
            abort(403, '𝐃𝐢𝐱𝐳𝐳𝐗𝐃 Protect - Akses ditolak❌');
        }

        return view('admin.api.index', [
            'keys' => ApiKey::query()->where('key_type', ApiKey::TYPE_APPLICATION)->get(),
        ]);
    }

    /**
     * Render view allowing an admin to create a new application API key.
     *
     * @throws \ReflectionException
     */
    public function create(): View
    {
        // 🔒 PROTEKSI: Cuma admin ID 1 yang bisa akses halaman create
        if (Auth::user()->id !== 1) {
            abort(403, '𝐃𝐢𝐱𝐳𝐳𝐗𝐃 Protect - Akses ditolak❌');
        }

        $resources = AdminAcl::getResourceList();
        sort($resources);

        return view('admin.api.new', [
            'resources' => $resources,
            'permissions' => [
                'r' => AdminAcl::READ,
                'rw' => AdminAcl::READ | AdminAcl::WRITE,
                'n' => AdminAcl::NONE,
            ],
        ]);
    }

    /**
     * Store the new key and redirect the user back to the application key listing.
     *
     * @throws \Pterodactyl\Exceptions\Model\DataValidationException
     */
    public function store(StoreApplicationApiKeyRequest $request): RedirectResponse
    {
        // 🔒 PROTEKSI: Cuma admin ID 1 yang bisa bikin PTLA
        if (Auth::user()->id !== 1) {
            abort(403, '𝐃𝐢𝐱𝐳𝐳𝐗𝐃 Protect - Akses ditolak❌');
        }

        $this->keyCreationService->setKeyType(ApiKey::TYPE_APPLICATION)->handle([
            'memo' => $request->input('memo'),
            'user_id' => $request->user()->id,
        ], $request->getKeyPermissions());

        $this->alert->success('A new application API key has been generated for your account.')->flash();

        return redirect()->route('admin.api.index');
    }

    /**
     * Delete an application API key from the database.
     */
    public function delete(Request $request, string $identifier): Response
    {
        // 🔒 PROTEKSI: Cuma admin ID 1 yang bisa hapus PTLA
        if (Auth::user()->id !== 1) {
            abort(403, '𝐃𝐢𝐱𝐳𝐳𝐗𝐃 Protect - Akses ditolak❌');
        }

        ApiKey::query()
            ->where('key_type', ApiKey::TYPE_APPLICATION)
            ->where('identifier', $identifier)
            ->delete();

        return response('', 204);
    }
}
EOF

# Set permission
chmod 644 "$REMOTE_PATH"
chown www-data:www-data "$REMOTE_PATH"

# Clear cache
echo "🔄 Membersihkan cache..."
cd /var/www/pterodactyl
php artisan view:clear
php artisan cache:clear
php artisan config:clear
php artisan route:clear

echo ""
echo "✅ PROTEKSI PTLA BERHASIL DIPASANG!"
echo "📂 Lokasi file: $REMOTE_PATH"
echo "🗂️ Backup: $BACKUP_PATH"
echo "🔒 Hanya Admin (ID 1) yang bisa akses & bikin PTLA"
