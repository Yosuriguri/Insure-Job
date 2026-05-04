<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인슈어잡 (InsureJob) - 대한민국 1등 보험 전문 구인구직 플랫폼</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&family=Noto+Sans+KR:wght@400;500;700;900&display=swap');
        body {
            font-family: 'Noto Sans KR', 'Inter', sans-serif;
        }
        .line-clamp-1 {
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-50 text-gray-900">

    <!-- Navigation -->
    <nav class="sticky top-0 z-50 bg-white border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-20">
                <div class="flex items-center">
                    <div class="flex-shrink-0 flex items-center gap-2">
                        <div class="bg-blue-600 p-2 rounded-lg text-white">
                            <i data-lucide="briefcase"></i>
                        </div>
                        <span class="text-2xl font-bold text-blue-900 tracking-tight">인슈어잡</span>
                    </div>
                    <div class="hidden md:ml-10 md:flex md:space-x-8" id="desktop-nav">
                        <!-- Navigation items will be injected here -->
                    </div>
                </div>
                <div class="hidden md:flex items-center space-x-4">
                    <button class="text-sm font-medium text-gray-500 hover:text-gray-900">로그인</button>
                    <button class="bg-blue-600 text-white px-5 py-2.5 rounded-full text-sm font-semibold hover:bg-blue-700 transition-colors shadow-sm">기업 서비스</button>
                </div>
                <div class="flex items-center md:hidden">
                    <button id="mobile-menu-button" class="p-2 text-gray-400 hover:text-gray-500">
                        <i data-lucide="menu"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-gray-100 p-4 space-y-4 shadow-xl">
            <!-- Mobile items will be injected here -->
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="bg-gradient-to-r from-blue-900 to-indigo-900 text-white py-16 sm:py-24">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h1 class="text-4xl sm:text-5xl font-extrabold mb-4 tracking-tight" id="hero-title"></h1>
            <p class="text-blue-100 text-lg mb-10 max-w-2xl mx-auto">보험 전문 커리어의 시작, 인슈어잡과 함께하세요.</p>
            
            <div class="max-w-3xl mx-auto relative">
                <div class="flex bg-white rounded-2xl shadow-2xl p-2 items-center">
                    <div class="flex-1 flex items-center px-4">
                        <i data-lucide="search" class="text-gray-400 w-5 h-5 mr-3"></i>
                        <input type="text" placeholder="직무, 회사명, 키워드를 입력하세요" class="w-full py-3 text-gray-900 focus:outline-none text-base">
                    </div>
                    <button class="bg-blue-600 text-white px-8 py-3 rounded-xl font-bold hover:bg-blue-700 transition-all">검색하기</button>
                </div>
                <div class="flex flex-wrap justify-center gap-2 mt-6" id="category-tags"></div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
            <!-- Left Column: Job Listings -->
            <div class="lg:col-span-8 space-y-8">
                <div class="flex justify-between items-center border-b border-gray-200 pb-4">
                    <h2 class="text-2xl font-bold text-gray-900 flex items-center gap-2">
                        최신 채용 정보
                        <span id="job-count" class="bg-blue-100 text-blue-600 text-xs px-2 py-1 rounded-full font-bold"></span>
                    </h2>
                    <button class="text-blue-600 text-sm font-semibold flex items-center gap-1 hover:underline">
                        전체보기 <i data-lucide="arrow-right" class="w-4 h-4"></i>
                    </button>
                </div>
                <div class="space-y-4" id="job-listings-container"></div>
            </div>

            <!-- Right Column -->
            <div class="lg:col-span-4 space-y-8">
                <!-- Featured Companies -->
                <div class="bg-white rounded-2xl p-6 border border-gray-100 shadow-sm">
                    <h2 class="text-xl font-bold text-gray-900 mb-6 flex items-center gap-2">
                        <i data-lucide="trophy" class="w-5 h-5 text-yellow-500"></i> 추천 보험사
                    </h2>
                    <div class="space-y-6" id="featured-companies-container"></div>
                    <button class="w-full mt-8 border border-gray-200 py-3 rounded-xl text-sm font-semibold text-gray-600 hover:bg-gray-50 transition-colors">인기 기업 전체보기</button>
                </div>

                <!-- Banner -->
                <div class="bg-blue-600 rounded-2xl p-6 text-white overflow-hidden relative">
                    <div class="relative z-10">
                        <h3 class="font-bold text-lg mb-2">보험 전문가를 위한<br>연봉 정보 서비스</h3>
                        <p class="text-blue-100 text-sm mb-4">내 경력에 맞는 평균 연봉을 확인해보세요.</p>
                        <button class="bg-white text-blue-600 px-4 py-2 rounded-lg text-sm font-bold shadow-lg">무료 조회하기</button>
                    </div>
                    <i data-lucide="users" class="absolute -bottom-4 -right-4 w-32 h-32 text-blue-500 opacity-20"></i>
                </div>

                <!-- Community -->
                <div class="bg-white rounded-2xl p-6 border border-gray-100 shadow-sm">
                    <h3 class="font-bold text-gray-900 mb-4">실시간 이직 상담</h3>
                    <div class="space-y-3">
                        <div class="p-3 bg-gray-50 rounded-lg text-sm border-l-4 border-blue-500">
                            <p class="font-medium text-gray-800 line-clamp-1">언더라이팅 경력 기술서 작성 팁 부탁드려요!</p>
                            <span class="text-xs text-gray-400">댓글 12개</span>
                        </div>
                        <div class="p-3 bg-gray-50 rounded-lg text-sm border-l-4 border-blue-500">
                            <p class="font-medium text-gray-800 line-clamp-1">삼성화재 면접 분위기 어떤가요?</p>
                            <span class="text-xs text-gray-400">댓글 8개</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white border-t border-gray-200 pt-16 pb-8 mt-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 gap-8 mb-12" id="footer-content">
                <div class="col-span-2">
                    <div class="flex items-center gap-2 mb-4 text-blue-900">
                        <div class="bg-blue-600 p-1.5 rounded-md text-white">
                            <i data-lucide="briefcase" class="w-4 h-4"></i>
                        </div>
                        <span class="text-xl font-bold">인슈어잡 (InsureJob)</span>
                    </div>
                    <p class="text-gray-500 text-sm max-w-xs mb-6">보험업계 리더들의 커리어 파트너. 최신 채용 정보부터 업계 인사이트까지 모두 인슈어잡에서 확인하세요.</p>
                </div>
                <!-- Dynamic Footer Menus -->
            </div>
            <div class="border-t border-gray-100 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
                <p class="text-xs text-gray-400">© 2026 InsureJob Inc. All rights reserved.</p>
                <div class="flex gap-6 text-xs text-gray-400 font-medium">
                    <a href="#" class="hover:text-gray-600">이용약관</a>
                    <a href="#" class="hover:text-gray-600">개인정보처리방침</a>
                    <a href="#" class="hover:text-gray-600">고객센터</a>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Data from JSON
        const data = [
            {
                "site_info": {
                    "name": "인슈어잡 (InsureJob)",
                    "description": "대한민국 1등 보험 전문 구인구직 플랫폼",
                    "categories": ["손해사정", "보험계리", "언더라이팅", "영업/설계", "보상관리", "보험IT/핀테크"]
                }
            },
            {
                "job_listings": [
                    { "id": 1, "company": "한국화재보험", "title": "기업보험 언더라이팅 경력직 채용", "location": "서울 중구", "experience": "경력 3-5년", "salary": "회사내규", "deadline": "2024-06-30", "tags": ["정규직", "식대제공", "자격증수당"] },
                    { "id": 2, "company": "디지털생명", "title": "보험 계리 시스템 개발자 모집", "location": "서울 강남구", "experience": "신입/경력", "salary": "5,000만원 이상", "deadline": "채용시 마감", "tags": ["재택근무", "유연근무", "스톡옵션"] },
                    { "id": 3, "company": "에이스손해사정", "title": "자동차보험 보상 서비스 대인보상 담당자", "location": "경기도 수원", "experience": "무관", "salary": "3,800 - 4,500", "deadline": "2024-05-15", "tags": ["인센티브", "차량지원", "우수사원포상"] }
                ]
            },
            {
                "featured_companies": [
                    { "name": "삼성화재", "logo_url": "https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=100&h=100&fit=crop", "rating": 4.5, "active_jobs": 12 },
                    { "name": "현대해상", "logo_url": "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=100&h=100&fit=crop", "rating": 4.2, "active_jobs": 8 },
                    { "name": "DB손해보험", "logo_url": "https://images.unsplash.com/photo-1554469384-e58fac16e23a?w=100&h=100&fit=crop", "rating": 4.0, "active_jobs": 15 }
                ]
            },
            {
                "navigation_menu": [
                    { "title": "채용정보", "sub_menu": ["직종별", "지역별", "상세검색", "TOP100"] },
                    { "title": "전문관", "sub_menu": ["손해사정사", "보험계리사", "FP/설계사"] },
                    { "title": "커뮤니티", "sub_menu": ["면접후기", "연봉정보", "이직상담"] }
                ]
            }
        ];

        const siteInfo = data[0].site_info;
        const jobListings = data[1].job_listings;
        const featuredCompanies = data[2].featured_companies;
        const navMenu = data[3].navigation_menu;

        // Initialize UI
        document.getElementById('hero-title').innerText = siteInfo.description;
        document.getElementById('job-count').innerText = jobListings.length;

        // Render Navigation
        const desktopNav = document.getElementById('desktop-nav');
        const mobileMenu = document.getElementById('mobile-menu');
        const footerContent = document.getElementById('footer-content');

        navMenu.forEach(menu => {
            // Desktop
            const menuDiv = document.createElement('div');
            menuDiv.className = 'relative group';
            menuDiv.innerHTML = `
                <button class="inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-700 hover:text-blue-600 transition-colors">
                    ${menu.title} <i data-lucide="chevron-down" class="ml-1 w-4 h-4"></i>
                </button>
                <div class="absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
                    <div class="py-1">
                        ${menu.sub_menu.map(sub => `<a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-600">${sub}</a>`).join('')}
                    </div>
                </div>
            `;
            desktopNav.appendChild(menuDiv);

            // Mobile
            const mobileDiv = document.createElement('div');
            mobileDiv.className = 'space-y-2';
            mobileDiv.innerHTML = `
                <div class="font-bold text-gray-900">${menu.title}</div>
                <div class="grid grid-cols-2 gap-2 pl-4">
                    ${menu.sub_menu.map(sub => `<a href="#" class="text-sm text-gray-500">${sub}</a>`).join('')}
                </div>
            `;
            mobileMenu.appendChild(mobileDiv);

            // Footer
            const footerDiv = document.createElement('div');
            footerDiv.innerHTML = `
                <h4 class="font-bold text-gray-900 mb-4">${menu.title}</h4>
                <ul class="space-y-2">
                    ${menu.sub_menu.map(sub => `<li><a href="#" class="text-sm text-gray-500 hover:text-blue-600">${sub}</a></li>`).join('')}
                </ul>
            `;
            footerContent.appendChild(footerDiv);
        });

        // Render Hero Categories
        const categoryContainer = document.getElementById('category-tags');
        siteInfo.categories.forEach(cat => {
            const btn = document.createElement('button');
            btn.className = 'bg-white/10 hover:bg-white/20 backdrop-blur-md px-4 py-1.5 rounded-full text-sm border border-white/20 transition-all';
            btn.innerText = `#${cat}`;
            categoryContainer.appendChild(btn);
        });

        // Render Job Listings
        const jobContainer = document.getElementById('job-listings-container');
        jobListings.forEach(job => {
            const jobEl = document.createElement('div');
            jobEl.className = 'bg-white rounded-2xl p-6 border border-gray-100 shadow-sm hover:shadow-md hover:border-blue-200 transition-all cursor-pointer group';
            jobEl.innerHTML = `
                <div class="flex flex-col sm:flex-row justify-between gap-4">
                    <div class="space-y-2">
                        <div class="flex items-center gap-2">
                            <span class="text-sm font-semibold text-blue-600 bg-blue-50 px-2 py-0.5 rounded">${job.company}</span>
                            <span class="text-xs text-gray-400 font-medium">|</span>
                            <span class="text-xs text-red-500 font-bold border border-red-100 px-1.5 py-0.5 rounded bg-red-50">D-${job.deadline.includes('마감') ? 'DAY' : '30'}</span>
                        </div>
                        <h3 class="text-xl font-bold text-gray-900 group-hover:text-blue-600 transition-colors">${job.title}</h3>
                        <div class="flex flex-wrap gap-4 text-sm text-gray-500 pt-1">
                            <span class="flex items-center gap-1"><i data-lucide="map-pin" class="w-4 h-4"></i> ${job.location}</span>
                            <span class="flex items-center gap-1"><i data-lucide="clock" class="w-4 h-4"></i> ${job.experience}</span>
                            <span class="flex items-center gap-1 font-medium text-gray-700">₩ ${job.salary}</span>
                        </div>
                    </div>
                    <div class="flex flex-col items-start sm:items-end justify-between gap-4">
                        <div class="flex flex-wrap gap-1">
                            ${job.tags.map(tag => `<span class="text-[11px] font-medium bg-gray-100 text-gray-600 px-2 py-1 rounded">${tag}</span>`).join('')}
                        </div>
                        <button class="bg-gray-900 text-white text-sm px-6 py-2 rounded-lg hover:bg-blue-600 transition-colors font-bold w-full sm:w-auto">즉시지원</button>
                    </div>
                </div>
            `;
            jobContainer.appendChild(jobEl);
        });

        // Render Featured Companies
        const companyContainer = document.getElementById('featured-companies-container');
        featuredCompanies.forEach(company => {
            const companyEl = document.createElement('div');
            companyEl.className = 'flex items-center justify-between group cursor-pointer';
            companyEl.innerHTML = `
                <div class="flex items-center gap-4">
                    <div class="w-12 h-12 rounded-xl bg-gray-50 border border-gray-100 flex items-center justify-center overflow-hidden">
                        <img src="${company.logo_url}" alt="${company.name}" class="w-full h-full object-cover" onerror="this.src='https://via.placeholder.com/100?text=Logo'">
                    </div>
                    <div>
                        <div class="font-bold text-gray-900 group-hover:text-blue-600 transition-colors">${company.name}</div>
                        <div class="flex items-center gap-1 text-sm text-gray-500">
                            <i data-lucide="star" class="w-3 h-3 text-yellow-400 fill-yellow-400"></i>
                            <span class="font-bold text-gray-700">${company.rating}</span>
                            <span class="mx-1">•</span>
                            <span>채용중 ${company.active_jobs}건</span>
                        </div>
                    </div>
                </div>
                <i data-lucide="chevron-right" class="text-gray-300 group-hover:text-blue-600 transition-colors"></i>
            `;
            companyContainer.appendChild(companyEl);
        });

        // Toggle Mobile Menu
        const menuBtn = document.getElementById('mobile-menu-button');
        menuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Initialize Icons
        lucide.createIcons();
    </script>
</body>
</html>
