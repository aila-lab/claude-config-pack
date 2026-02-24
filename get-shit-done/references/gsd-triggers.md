# GSD Intent Routing — Full Trigger Registry (26 Commands)

When user input matches triggers, **immediately** read the workflow file and execute it.

#### 1. NEW PROJECT
**Triggers:** "yeni proje", "new project", "projeyi baslat", "initialize project", "proje kur"
**Workflow:** `workflows/new-project.md` | **Also:** `references/questioning.md`, `references/ui-brand.md`, `templates/project.md`, `templates/requirements.md`
**INTEGRATION:** After PROJECT.md created, offer `prd` skill for feature PRDs → `ralph` skill for autonomous execution

#### 2. NEW MILESTONE
**Triggers:** "yeni milestone", "new milestone", "sonraki versiyon", "next version", "v2"
**Workflow:** `workflows/new-milestone.md`

#### 3. PLAN PHASE
**Triggers:** "faz planla", "plan phase", "planla", "plan yap", "plan olustur"
**Workflow:** `workflows/plan-phase.md` | **Agent:** gsd-planner

#### 4. EXECUTE PHASE
**Triggers:** "calistir", "execute", "fazı calistir", "implement", "kodla", "uygula"
**Workflow:** `workflows/execute-phase.md` | **Agent:** gsd-executor
**INTEGRATION:** Before execution, load relevant AI Team agent expertise (see Integration Bridge)

#### 5. DISCUSS PHASE
**Triggers:** "fazi tartis", "discuss phase", "tartisalim", "faz hakkinda konusalim"
**Workflow:** `workflows/discuss-phase.md`

#### 6. RESEARCH PHASE
**Triggers:** "arastir", "research", "fazi arastir", "inceleme yap"
**Workflow:** `workflows/research-phase.md` | **Agent:** gsd-phase-researcher

#### 7. VERIFY WORK
**Triggers:** "dogrula", "verify", "kontrol et", "test et", "calisiyor mu", "UAT"
**Workflow:** `workflows/verify-work.md` | **Agent:** gsd-verifier
**INTEGRATION:** Load QA + Cybersecurity + Performance agent expertise for comprehensive verification

#### 8. QUICK TASK
**Triggers:** "hizli gorev", "quick task", "hizlica yap", "quick"
**Workflow:** `workflows/quick.md`

#### 9. PROGRESS CHECK
**Triggers:** "durum", "progress", "neredeyiz", "ilerleme", "ne durumda", "status", "ozet"
**Workflow:** `workflows/progress.md`

#### 10. MAP CODEBASE
**Triggers:** "kodu analiz et", "map codebase", "codebase analiz", "kod yapisi"
**Workflow:** `workflows/map-codebase.md` | **Agent:** gsd-codebase-mapper

#### 11. ADD PHASE
**Triggers:** "faz ekle", "add phase", "yeni faz"
**Workflow:** `workflows/add-phase.md`

#### 12. INSERT PHASE
**Triggers:** "acil faz ekle", "insert phase", "araya faz ekle"
**Workflow:** `workflows/insert-phase.md`

#### 13. REMOVE PHASE
**Triggers:** "faz sil", "remove phase", "fazi kaldir"
**Workflow:** `workflows/remove-phase.md`

#### 14. ADD TODO
**Triggers:** "todo ekle", "not al", "bunu kaydet", "add todo", "sonra yap"
**Workflow:** `workflows/add-todo.md`

#### 15. CHECK TODOS
**Triggers:** "todolara bak", "check todos", "yapilacaklar", "todo list", "bekleyen isler"
**Workflow:** `workflows/check-todos.md`

#### 16. DEBUG
**Triggers:** "debug", "hata bul", "bug var", "sorun var", "calismıyor", "hata ayikla"
**Workflow:** `workflows/debug.md` | **Agent:** gsd-debugger

#### 17. PAUSE WORK
**Triggers:** "duraklat", "pause", "ara ver", "sonra devam"
**Workflow:** `workflows/pause-work.md`

#### 18. RESUME WORK
**Triggers:** "devam et", "resume", "kaldigim yerden", "nerede kalmistik"
**Workflow:** `workflows/resume-project.md`

#### 19. HEALTH CHECK
**Triggers:** "saglik kontrolu", "health", "health check"
**Workflow:** `workflows/health.md`

#### 20. SETTINGS
**Triggers:** "ayarlar", "settings", "gsd ayar", "konfigurasyon"
**Workflow:** `workflows/settings.md`

#### 21. SET PROFILE
**Triggers:** "profil degistir", "set profile", "model profili"
**Workflow:** `workflows/set-profile.md`

#### 22. COMPLETE MILESTONE
**Triggers:** "milestone tamamla", "complete milestone", "versiyon kapat"
**Workflow:** `workflows/complete-milestone.md`

#### 23. AUDIT MILESTONE
**Triggers:** "milestone denetle", "audit milestone"
**Workflow:** `workflows/audit-milestone.md` | **Agent:** gsd-integration-checker

#### 24. PLAN MILESTONE GAPS
**Triggers:** "eksikleri planla", "plan gaps", "eksik fazlari olustur"
**Workflow:** `workflows/plan-milestone-gaps.md`

#### 25. LIST PHASE ASSUMPTIONS
**Triggers:** "varsayimlar", "assumptions", "ne varsayiyorsun"
**Workflow:** `workflows/list-phase-assumptions.md`

#### 26. CLEANUP
**Triggers:** "temizle", "cleanup", "arsivle"
**Workflow:** `workflows/cleanup.md`
