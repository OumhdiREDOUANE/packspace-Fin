
"use client";

import { useState, useRef, useEffect } from "react";
import { ChevronDown, House, LucideLink2Off } from "lucide-react";
import Link from "next/link";

export default function NavBar({ navItems, isMobileMenuOpen,closeMobileMenu }) {
  const [activeDropdown, setActiveDropdown] = useState(null);
  const [activeGroup, setActiveGroup] = useState(null);
  const timeoutRef = useRef(null);
  const [expandedMobileItems, setExpandedMobileItems] = useState(new Set());
  const [expandedMobileGroups, setExpandedMobileGroups] = useState(new Set());

  const firstSixItems = navItems.slice(0, 6);

  // Desktop handlers
  const handleMouseEnter = (itemName) => {
    if (timeoutRef.current) clearTimeout(timeoutRef.current);
    setActiveDropdown(itemName);
  };

  const handleMouseLeave = () => {
    timeoutRef.current = setTimeout(() => {
      setActiveDropdown(null);
      setActiveGroup(null);
    }, 150);
  };

  const toggleGroup = (groupName) => {
    setActiveGroup(activeGroup === groupName ? null : groupName);
  };

  // Mobile handlers
  const toggleMobileDropdown = (itemName) => {
    setExpandedMobileItems((prev) =>
      prev.has(itemName) ? new Set() : new Set([itemName])
    );
    setExpandedMobileGroups(new Set());
  };

  const toggleMobileGroup = (groupName) => {
    setExpandedMobileGroups((prev) =>
      prev.has(groupName)
        ? new Set([...prev].filter((g) => g !== groupName))
        : new Set(prev.add(groupName))
    );
  };

  useEffect(() => {
    return () => {
      if (timeoutRef.current) clearTimeout(timeoutRef.current);
    };
  }, []);

  return (
    <>
      {/* Desktop Navigation */}
      <nav className="hidden md:block bg-[#C09200] text-white sticky top-0 z-40">
        <div className="w-full px-4 sm:px-6 lg:px-8">
          <div className="flex  items-center h-12">
            <div className="ml-13 flex items-center space-x-10 page-contentNave">

              {/* Home */}
              <div className="relative flex items-center h-full">
                <House className={`w-6 h-6 mr-1`} />
                <Link
                  href={`/`}
                  className="group relative flex items-center px-2 py-2 font-semibold text-lg tracking-normal transition-colors duration-200 whitespace-nowrap"
                > 
                    <span className="relative  font-semibold text-lg tracking-normal">

                 Acceuil
                 </span>
                    <span className="absolute left-0 bottom-0 w-0 h-0.5 bg-[#006294] transition-all duration-300 group-hover:w-full"></span>
                   
                    
                  
                </Link>
              </div>
<div
     onMouseEnter={() =>  handleMouseEnter("Tout produit")}
      onMouseLeave={handleMouseLeave}
  className="relative "
>
                  <Link href={`/category/${encodeURIComponent("Tout produit")}`} className="group relative flex items-center px-2 py-2 font-semibold text-lg tracking-normal transition-colors duration-200 whitespace-nowrap">
                    <span className="relative  font-semibold text-lg tracking-normal">
                      Tout produit
                      
                    </span>
                    <span className="absolute left-0 bottom-0 w-0 h-0.5 bg-[#006294] transition-all duration-300 group-hover:w-full"></span>
                    <ChevronDown
                        className={`w-4 h-4 ml-1 transition-transform duration-200 ${
                          activeDropdown === "Tout produit" ? "rotate-180" : ""
                        }`}
                      />
                  </Link>
{navItems.length > 0 && (
  (() => {
    const allDropdowns = navItems.flatMap((i) => i || []);

    return (
      <div
        className={`absolute top-full left-0 mt-1 bg-white rounded-xl shadow-lg border border-gray-200 transition-all duration-200 origin-top
        ${
          activeDropdown === "Tout produit"
            ? "opacity-100 scale-100 translate-y-0"
            : "opacity-0 scale-95 -translate-y-2 pointer-events-none"
        } `}
      >
        {/* 🔥 Mega Menu */}
        <div className="grid grid-cols-5 gap-8 p-4 min-w-[1300px]">

          {allDropdowns.map((dropdownItem, index) => (
            <div key={index} className="space-y-2">

              {/* ✅ اسم الفئة (Navbar Item) */}
              <h3 className="text-lg font-bold text-[#006294] px-3">
                {dropdownItem.name}
              </h3>

              {/* 🔽 قائمة المنتجات (من المجموعات + بدون مجموعة) */}
              <div className="flex flex-col space-y-1">

                {/* 🟦 منتجات داخل مجموعات */}
                {dropdownItem.dropdown
                  .filter((d) => d.isGroup)
                  .flatMap((g) => g.children || [])
                  .map((product) => (
                    <Link
                      key={product.name}
                      href={`/product/${encodeURIComponent(product.name)}`}
                      className="text-gray-700 text-sm px-3 py-1 rounded hover:text-[#006294] hover:bg-[#F2FAFD] transition"
                    >
                      {product.name}
                    </Link>
                  ))}

                {/* 🟩 منتجات خارج المجموعات */}
                {dropdownItem.dropdown
                  .filter((d) => !d.isGroup)
                  .map((product) => (
                    <Link
                      key={product.name}
                      href={`/product/${encodeURIComponent(product.name)}`}
                      className="text-gray-700 text-sm px-3 py-1 rounded hover:text-[#006294] hover:bg-[#F2FAFD] transition"
                    >
                      {product.name}
                    </Link>
                  ))}

              </div>
            </div>
          ))}

        </div>
      </div>
    );
  })()
)}
{navItems.length > 0 && (
  (() => {
    const allDropdowns = navItems.flatMap((i) => i || []);

    return (
      <div
        className={`absolute top-full left-0 mt-1 bg-white rounded-xl shadow-lg border border-gray-200 transition-all duration-200 origin-top
        ${
          activeDropdown === "Tout produit"
            ? "opacity-100 scale-100 translate-y-0"
            : "opacity-0 scale-95 -translate-y-2 pointer-events-none"
        } `}
      >
        {/* 🔥 Mega Menu */}
        <div className="grid grid-cols-5 gap-6 p-4 min-w-[1300px]">

          {allDropdowns.map((dropdownItem, index) => (
            <div key={index} className="space-y-2">

              {/* ✅ اسم الفئة (Navbar Item) */}
             
                <Link
                  href={`/category/${encodeURIComponent(dropdownItem.name)}`}
                  className=" group relative block px-3 py-2 text-lg font-bold text-[#006294] tracking-wide  transition-colors duration-150"
                >
                  <span className="relative">

                  {dropdownItem.name}
                    <span className="absolute left-0 bottom-0 w-0 h-0.5 bg-[#006294] transition-all duration-300 group-hover:w-full"></span>
                  </span>
                </Link>

              {/* 🔽 قائمة المنتجات (من المجموعات + بدون مجموعة) */}
              <div className="flex flex-col space-y-1">

                {/* 🟦 منتجات داخل مجموعات */}
                {dropdownItem.dropdown
                  .filter((d) => d.isGroup)
                  .flatMap((g) => g.children || [])
                  .map((product) => (
                    <Link
                      key={product.name}
                      href={`/product/${encodeURIComponent(product.name)}`}
                      className="text-gray-700 text-sm px-3 py-1 rounded hover:text-[#006294] hover:bg-[#F2FAFD] transition"
                    >
                      {product.name}
                    </Link>
                  ))}

                {/* 🟩 منتجات خارج المجموعات */}
                {dropdownItem.dropdown
                  .filter((d) => !d.isGroup)
                  .map((product) => (
                    <Link
                      key={product.name}
                      href={`/product/${encodeURIComponent(product.name)}`}
                      className="text-gray-700 text-sm px-3 py-1 rounded hover:text-[#006294] hover:bg-[#F2FAFD] transition"
                    >
                      {product.name}
                    </Link>
                  ))}

              </div>
            </div>
          ))}

        </div>
      </div>
    );
  })()
)}

                  </div>
              {/* First 6 items */}
              {firstSixItems.map((item) => (
                <DesktopNavItem
                  key={item.name}
                  item={item}
                  activeDropdown={activeDropdown}
                  activeGroup={activeGroup}
                  handleMouseEnter={handleMouseEnter}
                  handleMouseLeave={handleMouseLeave}
                  toggleGroup={toggleGroup}
                />
              ))}

        



                 
                
              

            </div>
          </div>
        </div>
      </nav>

      {/* Mobile Menu */}
      {isMobileMenuOpen && (
        <nav className="md:hidden bg-white border-b border-gray-200 sticky top-0 z-40">
          <div className="py-2 border-t border-gray-100">
            <div className="border-b border-gray-100">
              <Link href={`/`}
              onClick={closeMobileMenu}>
                <button className="w-full flex items-center justify-between px-4 py-3 font-semibold text-base uppercase text-[#006294] hover:bg-gray-50 transition-colors duration-200 tracking-wide">
                  <span>Acceuil</span>
                  <House className={`h-4 w-4`} />
                </button>
              </Link>
            </div>

            {navItems.map((item) => (
              <MobileNavItem
                key={item.name}
                item={item}
                expandedMobileItems={expandedMobileItems}
                toggleMobileDropdown={toggleMobileDropdown}
                expandedMobileGroups={expandedMobileGroups}
                toggleMobileGroup={toggleMobileGroup}
                closeMobileMenu={closeMobileMenu}
              />
            ))}

            {/* Tout produit */}
            <div className="border-b border-gray-100">
              
              <Link
              href={"/category/Tout produit"}
                onClick={() => {
                  toggleMobileDropdown("Tout produit")
                  closeMobileMenu();
                }}
                className="w-full flex items-center justify-between px-4 py-3 font-semibold text-base uppercase text-[#006294] hover:bg-gray-50 transition-colors duration-200 tracking-wide"
              >
                <span>Tout produit</span>
                <ChevronDown
                  className={`h-4 w-4 transition-transform duration-200 ${
                    expandedMobileItems.has("Tout produit")
                      ? "rotate-180"
                      : ""
                  }`}
                />
              </Link>
              <div
                className={`overflow-hidden transition-all duration-300 ${
                  expandedMobileItems.has("Tout produit")
                    ? "max-h-[3000px] opacity-100"
                    : "max-h-0 opacity-0"
                }`}
              >
                <div className="bg-[#F9FBFC] py-2">
                  {navItems.map((item) => (
                    <Link
                      key={item.name}
                      onClick={closeMobileMenu}
                      href={`/category/${encodeURIComponent(item.name)}`}
                      className="block px-6 py-2 text-sm font-normal text-gray-600 hover:bg-[#EDF8FF] hover:text-[#006294] transition-colors duration-200 tracking-wider"
                    >
                      {item.name}
                    </Link>
                  ))}
                </div>
              </div>
            </div>

          </div>
        </nav>
      )}
    </>
  );
}

// Component for Desktop Nav Item
function DesktopNavItem({
  item,
  activeDropdown,
  activeGroup,
  handleMouseEnter,
  handleMouseLeave,
  toggleGroup,
}) {
  return (
    <div
      className="relative"
      onMouseEnter={() => item.dropdown && handleMouseEnter(item.name)}
      onMouseLeave={handleMouseLeave}
    >
      <Link
        href={`/category/${encodeURIComponent(item.name)}`}
        className="group relative flex items-center px-2 py-2 font-semibold text-lg tracking-normal transition-colors duration-200 whitespace-nowrap"
      >
        <span className="relative font-semibold text-lg tracking-normal">
          {item.name === "hôtellerie-restauration"
            ? "Hôtellerie / Restauration"
            : item.name}
          <span className="absolute left-0 bottom-0 w-0 h-0.5 bg-[#006294] transition-all duration-300 group-hover:w-full"></span>
        </span>
        {item.dropdown && (
          <ChevronDown
            className={`w-4 h-4 ml-1 transition-transform duration-200 ${
              activeDropdown === item.name ? "rotate-180" : ""
            }`}
          />
        )}
      </Link>

      {item.dropdown && (
        <div
          className={`absolute top-full left-0 mt-1 w-56 bg-white rounded-xl shadow-lg border border-gray-200 transition-all duration-200 origin-top ${
            activeDropdown === item.name
              ? "opacity-100 scale-100 translate-y-0"
              : "opacity-0 scale-95 -translate-y-2 pointer-events-none"
          }`}
        >
          <div className="py-2">
            {item.dropdown.map((dropdownItem, index) => (
              <div key={index}>
                {dropdownItem.isGroup ? (
                  <>
                    <div
                      onClick={() => toggleGroup(dropdownItem.name)}
                      className="px-4 py-2 font-medium text-base tracking-wide text-[#006294] bg-gray-50 cursor-pointer flex justify-between items-center"
                    >
                      {dropdownItem.name}
                      <ChevronDown
                        className={`w-4 h-4 transition-transform duration-200 ${
                          activeGroup === dropdownItem.name
                            ? "rotate-180"
                            : ""
                        }`}
                      />
                    </div>
                    {activeGroup === dropdownItem.name &&
                      dropdownItem.children.map((child) => (
                        <Link
                          key={child.name}
                          href={`/product/${encodeURIComponent(child.name)}`}
                          className="block px-6 py-2 font-normal text-sm tracking-wider text-gray-700 hover:bg-[#F2FAFD] hover:text-[#006294] transition-colors duration-150"
                        >
                          {child.name}
                        </Link>
                      ))}
                  </>
                ) : (
                  <Link
                    href={`/product/${encodeURIComponent(dropdownItem.name)}`}
                    className="block px-4 py-2 font-medium text-base tracking-wide text-gray-700 hover:bg-[#F2FAFD] hover:text-[#006294] transition-colors duration-150"
                  >
                    {dropdownItem.name}
                  </Link>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

// Component for Mobile Nav Item
function MobileNavItem({
  item,
  expandedMobileItems,
  toggleMobileDropdown,
  expandedMobileGroups,
  toggleMobileGroup,
  closeMobileMenu,
}) {
  return (
    <div className="border-b border-gray-100">
      <Link href={`/category/${encodeURIComponent(item.name)}`}>
        <button
          onClick={() => {
            toggleMobileDropdown(item.name)
            closeMobileMenu();
          }}
          className="w-full flex items-center justify-between px-4 py-3 font-semibold text-base uppercase text-[#006294] hover:bg-gray-50 transition-colors duration-200 tracking-wide"
        >
          <span>{item.name}</span>
          <ChevronDown
            className={`h-4 w-4 transition-transform duration-200 ${
              expandedMobileItems.has(item.name) ? "rotate-180" : ""
            }`}
          />
        </button>
      </Link>

      <div
        className={`overflow-hidden transition-all duration-300 ${
          expandedMobileItems.has(item.name)
            ? "max-h-[2000px] opacity-100"
            : "max-h-0 opacity-0"
        }`}
      >
        <div className="bg-[#F9FBFC] py-2">
          {item.dropdown.map((dropdownItem) => (
            <div key={dropdownItem.name}>
              {dropdownItem.isGroup ? (
                <>
                  <button
                    onClick={() => toggleMobileGroup(dropdownItem.name)}
                    className="w-full text-left px-6 py-2 text-sm font-medium text-[#C09200] bg-gray-50 flex justify-between items-center tracking-wide"
                  >
                    {dropdownItem.name}
                    <ChevronDown
                      className={`h-4 w-4 transition-transform duration-200 ${
                        expandedMobileGroups.has(dropdownItem.name)
                          ? "rotate-180"
                          : ""
                      }`}
                    />
                  </button>
                  <div
                    className={`overflow-hidden transition-all duration-300 ${
                      expandedMobileGroups.has(dropdownItem.name)
                        ? "max-h-[2000px] opacity-100"
                        : "max-h-0 opacity-0"
                    }`}
                  >
                    {dropdownItem.children.map((child) => (
                      <Link
                        key={child.name}
                        onClick={closeMobileMenu}
                        href={`/product/${encodeURIComponent(child.name)}`}
                        className="block px-8 py-2 text-xs font-normal text-gray-600 hover:bg-[#EDF8FF] hover:text-[#006294] transition-colors duration-200 tracking-wider"
                      >
                        {child.name}
                      </Link>
                    ))}
                  </div>
                </>
              ) : (
                <Link
                onClick={closeMobileMenu}
                  href={`/product/${encodeURIComponent(dropdownItem.name)}`}
                  className="block px-6 py-2 text-xs font-normal text-gray-600 hover:bg-[#EDF8FF] hover:text-[#006294] transition-colors duration-200 tracking-wider"
                >
                  {dropdownItem.name}
                </Link>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
